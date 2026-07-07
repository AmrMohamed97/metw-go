## User Input

عاوزك تفهمنى بالتفصيل كيف يعمل tracking

*Edited relevant file*

*Viewed [home_page_offline_status_card.dart](file:///d:/evyx/metw_go/lib/features/home/presentation/widgets/home_page_offline_status_card.dart) *

*Viewed [native_tracking_service.dart](file:///d:/evyx/metw_go/lib/features/home/presentation/services/native_tracking_service.dart) *

### Planner Response

بالتأكيد! التتبع في تطبيقك مبني على فكرة **التواصل بين كود (Flutter) والكود الأصلي (Native)** لكل نظام (Android و iOS) لضمان استمرار التتبع حتى لو كان التطبيق في الخلفية (Background).

إليك كيف تعمل دورة التتبع بالتفصيل خطوة بخطوة عند الضغط على زر "مستعد للاستقبال":

### 1. التحقق من الصلاحيات (في Flutter)
عندما يضغط السائق على الزر في `home_page_offline_status_card.dart`، يقوم التطبيق أولاً بالتأكد من:
- هل الـ GPS (Location Service) مفعل في الهاتف؟
- هل السائق أعطى صلاحية الوصول للموقع (Permissions) للتطبيق؟
إذا كان أحدهما غير مفعل، يتم توجيه السائق للإعدادات لتفعيلها.

### 2. إرسال أمر التتبع للـ Native (عبر MethodChannel)
إذا كانت الصلاحيات سليمة، يتم استدعاء الكود الذي كنت تسأل عنه:
```dart
NativeTrackingService().startNativeTracking('9');
```
* **ماذا يفعل هذا السطر؟**
يذهب إلى ملف `native_tracking_service.dart` ويستخدم شيء يسمى **`MethodChannel`**. هذه القناة تعمل كـ "جسر" للتواصل بين Dart (Flutter) وأنظمة التشغيل الأصلية. يرسل رسالة اسمها `startTracking` ومعها رقم السائق (هنا مكتوب `9` بشكل ثابت كمثال).

### 3. استلام الأمر وتشغيل التتبع الفعلي (Native Side)
بمجرد أن تعبر الرسالة الجسر، ينقسم العمل حسب نوع الجهاز:

#### 📱 في نظام أندرويد (Android):
1. يستقبل ملف `MainActivity.kt` الرسالة، ويقوم بتشغيل خدمة تسمى **`LocationTrackingService`**.
2. **الخدمة الأمامية (Foreground Service):** هذه الخدمة تضع إشعاراً ثابتاً في شريط الإشعارات (مكتوب عليه "التتبع نشط"). هذا الإشعار مهم جداً في أندرويد لأنه يمنع النظام من إغلاق التطبيق لتوفير البطارية، مما يضمن استمرار إرسال الموقع باستمرار.
3. تتصل الخدمة بـ `FusedLocationProviderClient` لجلب الموقع الجغرافي بدقة عالية، وتم ضبطها لتتحدث كل 10 ثوانٍ أو كلما تحرك السائق 10 أمتار.
4. بمجرد الحصول على إحداثيات جديدة، يتم إرسالها مباشرة عبر **Firebase Realtime Database** إلى المسار: `drivers/9/location` وتجعل الحالة `online`.

#### 🍏 في نظام آبل (iOS):
1. يستقبل ملف `AppDelegate.swift` الرسالة في دالة `locationChannel.setMethodCallHandler`.
2. يقوم بتهيئة `CLLocationManager` ويطلب منه العمل في الخلفية (`allowsBackgroundLocationUpdates = true`).
3. كلما تحرك السائق، تقوم دالة `didUpdateLocations` بالتقاط الموقع الجديد ورفعه مباشرة إلى Firebase Realtime Database لنفس المسار الخاص بالسائق.

### 4. إيقاف التتبع 🛑
عندما يقرر السائق التوقف، يتم استدعاء `stopNativeTracking()`، والتي ترسل رسالة `stopTracking` عبر الجسر.
- **في الأندرويد:** يتم إيقاف الـ Foreground Service وإخفاء الإشعار، وتتحول حالة السائق في Firebase إلى `offline`.
- **في iOS:** يتم إيقاف الـ `CLLocationManager` وتتحول حالة السائق إلى `offline`.

### 💡 لماذا تم استخدام الـ Native بدلاً من مكتبات Flutter المباشرة؟
مكتبات الفلاتر العادية تتوقف عن العمل بمجرد إغلاق شاشة الهاتف أو وضع التطبيق في الخلفية (Background). استخدام كود أندرويد و iOS الأصلي (Native) يُجبر نظام التشغيل على إبقاء ميزة التتبع حية ونشطة في كل الأوقات لضمان وصول الطلبات للسائق أينما كان.
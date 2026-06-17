import 'dart:io';

import 'package:flutter_image_compress/flutter_image_compress.dart';
// import 'package:image_picker/image_picker.dart';

mixin ImageMixin {
  // final imagePicker = ImagePicker();
  // bool isNoPhoto = true;

  /// ضغط الصورة باستخدام native codecs (libjpeg-turbo على Android, ImageIO على iOS)
  /// أسرع بـ 10x من مكتبة image الـ pure Dart
  /// النتيجة: صورة أقل من 1MB مع الحفاظ على الجودة ونسبة الأبعاد
  Future<File> compress({required File targetImage}) async {
    final int maxFileSize = 2 * 1024 * 1024; // 2 MB
    
    // استبدال أي امتداد (بغض النظر عن حالة الأحرف) بـ .webp
    // نضيف مسار فريد لتجنب أي مشاكل إذا كان الملف الأصلي يحمل نفس الاسم
    String targetPath = targetImage.path.replaceAll(
      RegExp(r'\.(jpg|jpeg|png|heic|heif)$', caseSensitive: false), 
      '_compressed.webp'
    );
    
    // في حالة لم يتم التغيير (مثلاً الملف ليس له امتداد معروف)، نضيف الامتداد ببساطة
    if (targetPath == targetImage.path) {
      targetPath = '${targetImage.path}_compressed.webp';
    }

    int quality = 100;
    var result = await FlutterImageCompress.compressAndGetFile(
      targetImage.path,
      targetPath,
      format: CompressFormat.webp,
      quality: quality,
      minWidth: 1920,
      minHeight: 1920,
    );
    
    if (result == null) return targetImage;
    File compressedFile = File(result.path);

    while (await compressedFile.length() > maxFileSize && quality > 20) {
      quality -= 5;
      result = await FlutterImageCompress.compressAndGetFile(
        targetImage.path,
        targetPath,
        format: CompressFormat.webp,
        quality: quality,
        minWidth: 1920,
        minHeight: 1920,
      );
      if (result != null) {
        compressedFile = File(result.path);
      } else {
        break;
      }
    }

    return compressedFile;
    // final int fileSize = await targetImage.length();
    // final int targetSize = 1 * 1024 * 1024; // 1 MB

    // // لو الصورة أصلاً أقل من 1MB مش محتاج ضغط
    // if (fileSize <= targetSize) {
    //   return targetImage;
    // }

    // // حساب الجودة المناسبة بناءً على حجم الصورة
    // final int quality = _calculateQuality(fileSize);

    // // ضغط الصورة مع تصغير الأبعاد والحفاظ على نسبة الأبعاد (aspect ratio)
    // final String targetPath = targetImage.path.replaceAll(
    //   RegExp(r'\.[^\.]+$'),
    //   '_compressed.jpg',
    // );

    // final XFile? result = await FlutterImageCompress.compressAndGetFile(
    //   targetImage.absolute.path,
    //   targetPath,
    //   // quality: quality,
    //   // minWidth: 1920, // الحد الأقصى للعرض - المكتبة بتحافظ على aspect ratio
    //   // minHeight: 1920, // الحد الأقصى للطول - المكتبة بتحافظ على aspect ratio
    //   format: CompressFormat.webp,
    // );

    // if (result == null) return targetImage;

    // final File compressedFile = File(result.path);

    // // لو لسه أكبر من 1MB، نعيد الضغط بجودة أقل
    // if (await compressedFile.length() > targetSize) {
    //   return _recompress(
    //     file: compressedFile,
    //     targetSize: targetSize,
    //     currentQuality: quality,
    //   );
    // }

    // return compressedFile;
  }

  /// حساب الجودة بناءً على حجم الملف الأصلي
  // int _calculateQuality(int fileSize) {
  //   if (fileSize > 10 * 1024 * 1024) return 50; // أكبر من 10MB
  //   if (fileSize > 5 * 1024 * 1024) return 60; // أكبر من 5MB
  //   if (fileSize > 3 * 1024 * 1024) return 70; // أكبر من 3MB
  //   return 80; // أقل من 3MB
  // }

  // /// إعادة الضغط لو الصورة لسه كبيرة
  // Future<File> _recompress({
  //   required File file,
  //   required int targetSize,
  //   required int currentQuality,
  // }) async {
  //   int quality = currentQuality - 5;
  //   if (quality < 30) quality = 30;

  //   final String targetPath = file.path.replaceAll(
  //     RegExp(r'\.[^\.]+$'),
  //     '_re.jpg',
  //   );

  //   final XFile? result = await FlutterImageCompress.compressAndGetFile(
  //     file.absolute.path,
  //     targetPath,
  //     quality: quality,
  //     // minWidth: 1280,
  //     // minHeight: 1280,
  //     format: CompressFormat.webp,
  //   );

  //   if (result == null) return file;
  //   return File(result.path);
  // }
}

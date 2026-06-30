import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:metw_go/core/di/dependency_injection.dart';
import 'package:metw_go/features/comming_soon/comming_soon_page.dart';
import 'package:metw_go/features/complete_order_details/presentation/page/complete_order_page.dart';
import 'package:metw_go/features/documents/presentation/manager/documents_cubit.dart';
import 'package:metw_go/features/documents/presentation/page/documents_page.dart';
import 'package:metw_go/features/driver_info/presentation/manager/delegate_info_cubit.dart';
import 'package:metw_go/features/driver_info/presentation/page/delegate_info_page.dart';
import 'package:metw_go/features/forget_password/presentation/manager/forget_password_cubit.dart';
import 'package:metw_go/features/forget_password/presentation/page/change_password_page.dart';
import 'package:metw_go/features/forget_password/presentation/page/forget_password_page.dart';
import 'package:metw_go/features/history/presentation/page/history_page.dart';
import 'package:metw_go/features/login/presentation/manager/login_cubit.dart';
import 'package:metw_go/features/login/presentation/page/login_page.dart';
import 'package:metw_go/features/main_view/main_view.dart';
import 'package:metw_go/features/notification/presentation/manager/notification_cubit.dart';
import 'package:metw_go/features/notification/presentation/page/notification_page.dart';
import 'package:metw_go/features/order_details/presentation/order_details_page.dart';
import 'package:metw_go/features/otp/presentation/manager/otp_cubit.dart';
import 'package:metw_go/features/otp/presentation/page/otp_page.dart';
import 'package:metw_go/features/personal_info/presentation/manager/personal_info_cubit.dart';
import 'package:metw_go/features/personal_info/presentation/page/personal_info_page.dart';
import 'package:metw_go/features/register/presentation/manager/register_cubit.dart';
import 'package:metw_go/features/register/presentation/page/register_page.dart';
import 'package:metw_go/features/service_areas/presentation/manager/service_areas_cubit.dart';
import 'package:metw_go/features/service_areas/presentation/page/service_areas_page.dart';
import 'package:metw_go/features/vehicle_data/presentation/manager/vehicle_cubit.dart';
import 'package:metw_go/features/vehicle_data/presentation/page/vehicle_page.dart';

import 'app_routes.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.mainView,
    // redirect: (context, state) async {
    //   final String currentPath = state.matchedLocation;

    //   // 1. الخروج المبكر: لا نحتاج لهذه الحسابات إلا عند محاولة فتح الصفحة الرئيسية
    //   if (currentPath != '/') return null;

    //   bool? isonboardingCompleted = CacheHelper.getData(
    //     key: AppConstant.isOnboarding,
    //   );

    //   // إذا لم يكمل المستخدم الـ onboarding، نقله لصفحة الـ onboarding
    //   if (isonboardingCompleted == null) return AppRoutes.onbording;

    //   final Future<String> tokenFuture = CacheHelper.getSecuerString(
    //     key: AppConstant.accessToken,
    //   );

    //   // 2. جلب البيانات بشكل متوازٍ (Parallel Fetch) لتحسين الأداء
    //   final UserModel? userData = CacheHelper.getUserData();
    //   final String token = await tokenFuture;

    //   // 3. التحقق من التوكن
    //   if (token.isEmpty) return AppRoutes.login;

    //   // 4. التحقق من بيانات المستخدم وصلاحياته
    //   final String? roles = userData?.role;
    //   if (roles == null || roles.isEmpty) {
    //     return AppRoutes.login;
    //   }

    //   // 5. التوجيه بناءً على الصلاحية (مبسط بدون تداخل if-else)
    //   switch (roles) {
    //     case "admin":
    //       return AppRoutes.admin;
    //     case "doctor":
    //       return AppRoutes.doctor;
    //     case "lab":
    //       return AppRoutes.sectionWorker;
    //     case "delivery":
    //       return AppRoutes.openLocationPage;
    //     default:
    //       return AppRoutes.login;
    //   }
    // },
    routes: [
      GoRoute(
        path: AppRoutes.otp,
        name: AppRoutes.otp,
        builder: (context, state) {
          bool? fromLogin = state.extra as bool?;
          return BlocProvider(
            create: (context) => getIt<OtpCubit>(),
            child: OtpPage(fromLogin: fromLogin ?? false),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.login,
        name: AppRoutes.login,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<LoginCubit>(),
          child: const LoginPage(),
        ),
      ),
      GoRoute(
        path: AppRoutes.register,
        name: AppRoutes.register,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<RegisterCubit>(),
          child: const RegisterPage(),
        ),
      ),
      GoRoute(
        path: AppRoutes.changePasswordPage,
        name: AppRoutes.changePasswordPage,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<ForgetPasswordCubit>(),
          child: const ChangePasswordPage(),
        ),
      ),
      GoRoute(
        path: AppRoutes.forgetPasswordPage,
        name: AppRoutes.forgetPasswordPage,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<ForgetPasswordCubit>(),
          child: const ForgetPasswordPage(),
        ),
      ),
      GoRoute(
        path: AppRoutes.commingSoonPage,
        name: AppRoutes.commingSoonPage,
        builder: (context, state) => const CommingSoonPage(),
      ),
      GoRoute(
        path: AppRoutes.mainView,
        name: AppRoutes.mainView,
        builder: (context, state) => const MainView(),
      ),
      // Profile View ---------------------------------------
      GoRoute(
        path: AppRoutes.historyPage,
        name: AppRoutes.historyPage,
        builder: (context, state) => const HistoryPage(),
      ),
      GoRoute(
        path: AppRoutes.completeOrderPage,
        name: AppRoutes.completeOrderPage,
        builder: (context, state) => const CompleteOrderPage(),
      ),
      GoRoute(
        path: AppRoutes.orderDetailsPage,
        name: AppRoutes.orderDetailsPage,
        builder: (context, state) => const OrderDetailsPage(),
      ),
      GoRoute(
        path: AppRoutes.personalInfoPage,
        name: AppRoutes.personalInfoPage,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<PersonalInfoCubit>(),
          child: const PersonalInfoPage(),
        ),
      ),
      GoRoute(
        path: AppRoutes.delegateInfoPage,
        name: AppRoutes.delegateInfoPage,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<DelegateInfoCubit>(),
          child: const DelegateInfoPage(),
        ),
      ),
      GoRoute(
        path: AppRoutes.vehiclePage,
        name: AppRoutes.vehiclePage,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<VehicleCubit>(),
          child: const VehiclePage(),
        ),
      ),
      GoRoute(
        path: AppRoutes.serviceAreasPage,
        name: AppRoutes.serviceAreasPage,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<ServiceAreasCubit>(),
          child: const ServiceAreasPage(),
        ),
      ),
      GoRoute(
        path: AppRoutes.documentsPage,
        name: AppRoutes.documentsPage,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<DocumentsCubit>(),
          child: const DocumentsPage(),
        ),
      ),
      GoRoute(
        path: AppRoutes.notificationPage,
        name: AppRoutes.notificationPage,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<NotificationCubit>(),
          child: const NotificationPage(),
        ),
      ),

      // ========== onbording ==========
      // GoRoute(
      //   path: AppRoutes.onbording,
      //   name: AppRoutes.onbordingName,
      //   builder: (context, state) => const OnbordingPage(),
      // ),
      // // ========== Auth Routes ==========
      // GoRoute(
      //   path: AppRoutes.login,
      //   name: AppRoutes.loginName,
      //   builder: (context, state) => BlocProvider(
      //     create: (context) => getIt<LoginCubit>(),
      //     child: const LoginScreen(),
      //   ),
      // ),
      // GoRoute(
      //   path: AppRoutes.register,
      //   name: AppRoutes.registerName,
      //   builder: (context, state) => BlocProvider(
      //     create: (context) => getIt<DocSignupCubit>(),
      //     child: const DocSignupScreen(),
      //   ),
      // ),
      // // ========== openLocationPage Routes ==========
      // GoRoute(
      //   path: AppRoutes.openLocationPage,
      //   name: AppRoutes.openLocationPageName,
      //   builder: (context, state) => const OpenLocationPage(),
      // ),
    ],
  );
}

import 'package:go_router/go_router.dart';
import 'package:metw_go/core/const/app_const.dart';
import 'package:metw_go/core/models/user_model.dart';
import 'package:metw_go/core/utils/cache_helper.dart';
import 'package:metw_go/features/auth/presentation/sign_up_flow_screen.dart';
import 'app_routes.dart';


class AppRouter {
  static final GoRouter router = GoRouter(
    // initialLocation: AppRoutes.onbording,
    redirect: (context, state) async {
      final String currentPath = state.matchedLocation;

      // 1. الخروج المبكر: لا نحتاج لهذه الحسابات إلا عند محاولة فتح الصفحة الرئيسية
      if (currentPath != '/') return null;

      bool? isonboardingCompleted = CacheHelper.getData(
        key: AppConstant.isOnboarding,
      );

      // إذا لم يكمل المستخدم الـ onboarding، نقله لصفحة الـ onboarding
      if (isonboardingCompleted == null) return AppRoutes.onbording;

      final Future<String> tokenFuture = CacheHelper.getSecuerString(
        key: AppConstant.accessToken,
      );

      // 2. جلب البيانات بشكل متوازٍ (Parallel Fetch) لتحسين الأداء
      final UserModel? userData = CacheHelper.getUserData();
      final String token = await tokenFuture;

      // 3. التحقق من التوكن
      if (token.isEmpty) return AppRoutes.login;

      // 4. التحقق من بيانات المستخدم وصلاحياته
      final String? roles = userData?.role;
      if (roles == null || roles.isEmpty) {
        return AppRoutes.login;
      }

      // 5. التوجيه بناءً على الصلاحية (مبسط بدون تداخل if-else)
      switch (roles) {
        case "admin":
          return AppRoutes.admin;
        case "doctor":
          return AppRoutes.doctor;
        case "lab":
          return AppRoutes.sectionWorker;
        case "delivery":
          return AppRoutes.openLocationPage;
        default:
          return AppRoutes.login;
      }
    },
    routes: [
      GoRoute(
        path: AppRoutes.onbording,
        name: AppRoutes.onbordingName,
        builder: (context, state) => const SignUpFlowScreen(),
      ),
      GoRoute(
        path: AppRoutes.login,
        name: AppRoutes.loginName,
        builder: (context, state) => const SignUpFlowScreen(),
      ),
      GoRoute(
        path: AppRoutes.register,
        name: AppRoutes.registerName,
        builder: (context, state) => const SignUpFlowScreen(),
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

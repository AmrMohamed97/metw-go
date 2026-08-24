import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:metw_go/core/di/dependency_injection.dart';
import 'package:metw_go/core/models/auth_model/auth_model.dart';
import 'package:metw_go/core/utils/cache_helper.dart';
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
import 'package:metw_go/features/order_details/presentation/cubit/order_details_cubit.dart';
import 'package:metw_go/features/order_details/presentation/order_details_page.dart';
import 'package:metw_go/features/otp/presentation/manager/otp_cubit.dart';
import 'package:metw_go/features/otp/presentation/page/otp_page.dart';
import 'package:metw_go/features/personal_info/presentation/manager/personal_info_cubit.dart';
import 'package:metw_go/features/personal_info/presentation/page/personal_info_page.dart';
import 'package:metw_go/features/register/presentation/manager/register_cubit.dart';
import 'package:metw_go/features/register/presentation/page/register_page.dart';
import 'package:metw_go/features/register_steps/presentation/manager/first_step_cubit/first_step_cubit.dart';
import 'package:metw_go/features/register_steps/presentation/manager/fourth_step_cubit/fourth_step_cubit.dart';
import 'package:metw_go/features/register_steps/presentation/manager/second_step_cubit.dart/second_step_cubit.dart';
import 'package:metw_go/features/register_steps/presentation/manager/third_step_cubit.dart/third_step_cubit.dart';
import 'package:metw_go/features/register_steps/presentation/pages/first_step_page.dart';
import 'package:metw_go/features/register_steps/presentation/pages/fourth_step_page.dart';
import 'package:metw_go/features/register_steps/presentation/pages/second_step_page.dart';
import 'package:metw_go/features/register_steps/presentation/pages/third_step_page.dart';
import 'package:metw_go/features/service_areas/presentation/manager/service_areas_cubit.dart';
import 'package:metw_go/features/service_areas/presentation/page/service_areas_page.dart';
import 'package:metw_go/features/splash_screen/splash_screen.dart';
import 'package:metw_go/features/vehicle_data/presentation/manager/vehicle_cubit.dart';
import 'package:metw_go/features/vehicle_data/presentation/page/vehicle_page.dart';
import 'package:metw_go/features/wallet_transaction/presentation/manager/wallet_operation_cubit.dart';
import 'package:metw_go/features/wallet_transaction/presentation/page/wallet_operation_page.dart';

import 'app_routes.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.login,
    redirect: (context, state) {
      final AuthModel? authData = CacheHelper.getauthData();
      final bool isComplete = authData?.status == "complete";
      final String currentLocation = state.matchedLocation;

      if (isComplete) {
        if (currentLocation == AppRoutes.login) {
          return AppRoutes.splashScreen;
        }
      } else {
        if (currentLocation == AppRoutes.splashScreen) {
          return AppRoutes.login;
        }
      }
      return null;
    },
    routes: [
      GoRoute(
        path: AppRoutes.splashScreen,
        name: AppRoutes.splashScreen,
        builder: (context, state) {
          return SplashScreen();
        },
      ),
      GoRoute(
        path: AppRoutes.otp,
        name: AppRoutes.otp,
        builder: (context, state) {
          // final extra = state.extra;
          final arg = state.extra as (bool, String);
          bool fromLogin = arg.$1;
          String phone = arg.$2;
          // if (extra is bool) {
          //   fromLogin = extra;
          // } else if (extra is Map<String, dynamic>) {
          //   fromLogin = extra['fromLogin'] ?? false;
          //   phone = extra['phone'] ?? '';
          // }
          return BlocProvider(
            create: (context) => getIt<OtpCubit>(),
            child: OtpPage(fromLogin: fromLogin, phone: phone),
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
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<OrderDetailsCubit>(),
          child: OrderDetailsPage(orderId: state.extra as int),
        ),
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
          create: (context) => getIt<DelegateInfoCubit>()..getWarehouses(),
          child: const DelegateInfoPage(),
        ),
      ),
      GoRoute(
        path: AppRoutes.vehiclePage,
        name: AppRoutes.vehiclePage,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<VehicleCubit>()..init(),
          child: const VehiclePage(),
        ),
      ),
      GoRoute(
        path: AppRoutes.serviceAreasPage,
        name: AppRoutes.serviceAreasPage,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<ServiceAreasCubit>()..init(),
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
      GoRoute(
        path: AppRoutes.firstStepPage,
        name: AppRoutes.firstStepPage,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<FirstStepCubit>()..getWarehouses(),
          // ..getTransportTypes(),
          child: const FirstStepPage(),
        ),
      ),
      GoRoute(
        path: AppRoutes.secondStepPage,
        name: AppRoutes.secondStepPage,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<SecondStepCubit>()..init(),
          child: const SecondStepPage(),
        ),
      ),
      GoRoute(
        path: AppRoutes.thirdStepPage,
        name: AppRoutes.thirdStepPage,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<ThirdStepCubit>()..init(),
          child: const ThirdStepPage(),
        ),
      ),
      GoRoute(
        path: AppRoutes.fourthStepPage,
        name: AppRoutes.fourthStepPage,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<FourthStepCubit>(),
          child: const FourthStepPage(),
        ),
      ),
      GoRoute(
        path: AppRoutes.walletOperationPage,
        name: AppRoutes.walletOperationPage,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<WalletOperationCubit>()..init(),
          child: const WalletOperationPage(),
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

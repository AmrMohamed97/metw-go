import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:metw_go/core/cubit/app_cubit.dart';
import 'package:metw_go/core/cubit/app_state.dart';
import 'package:metw_go/core/router/app_routes.dart';
import 'package:metw_go/core/utils/app_images.dart';
import 'package:metw_go/core/widgets/custom_error_widget.dart';
import 'package:metw_go/core/widgets/screen_wrapper.dart';
import 'package:metw_go/features/home/presentation/services/location_service.dart';
import 'package:metw_go/features/home/presentation/services/tracking_location_service.dart';
import 'package:permission_handler/permission_handler.dart' as ph;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    BlocProvider.of<AppCubit>(context).realTime(9);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        final appCubit = context.read<AppCubit>();
        return ScreenWrapper(
          body: state is HomeStatusError
              ? CustomErrorWidget(
                  errorMessage: state.error,
                  onPressed: () => appCubit.realTime(9),
                )
              : Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(),
                      Image.asset(AppImages.logo, width: 180.w)
                          .animate(onPlay: (controller) => controller.repeat())
                          .shimmer(
                            duration: 1800.ms,
                            color: Colors.white.withValues(alpha: 0.5),
                          )
                          .pulse(duration: 1800.ms, curve: Curves.easeInOut),
                      //--------------------------------------------------------------------------
                      state is HomeStatusLoading
                          ? SizedBox()
                          : NextPage(), //open location start tracking then navigate to base view
                      const Spacer(),
                      SpinKitThreeBounce(
                        color: Theme.of(context).primaryColor,
                        size: 28.sp,
                      ),
                      30.verticalSpace,
                    ],
                  ),
                ),
        );
      },
    );
  }
}

class NextPage extends StatefulWidget {
  const NextPage({super.key});

  @override
  State<NextPage> createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  @override
  void initState() {
    if (BlocProvider.of<AppCubit>(context).status == 'offline') {
      context.go(AppRoutes.mainView);
    } else {
      nextPage();
    }
    super.initState();
  }

  void nextPage() async {
    final locationService = LocationService();
    bool serviceEnabled = await locationService
        .checkAndRequestLocationService();
    if (!serviceEnabled) {
      await ph.openAppSettings();
      // return;
    }
    bool permissionGranted = await locationService.checkAndRequestPermission();
    if (!permissionGranted) {
      await ph.openAppSettings();
      // return;
    }
    TrackingLocationService().startTracking(driverId: '9');
    context.go(AppRoutes.mainView);
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}

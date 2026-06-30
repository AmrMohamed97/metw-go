import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:metw_go/core/cubit/app_cubit.dart';
import 'package:metw_go/core/cubit/app_state.dart';
import 'package:metw_go/core/utils/app_images.dart';
import 'package:metw_go/core/widgets/custom_error_widget.dart';
import 'package:metw_go/core/widgets/screen_wrapper.dart';

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
                      ?SizedBox()
                      :appCubit.status=='offline'
                      ?//navigate to mainview
                      : ,//open location start tracking then navigate to base view
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

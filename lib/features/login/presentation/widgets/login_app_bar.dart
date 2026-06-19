import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:metw_go/core/utils/app_images.dart';

class LoginAppBar extends StatefulWidget {
  const LoginAppBar({super.key});

  @override
  State<LoginAppBar> createState() => _LoginAppBarState();
}

class _LoginAppBarState extends State<LoginAppBar>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      floating: false,
      pinned: true,
      elevation: 0,
      primary: true,
      shadowColor: Colors.transparent,
      snap: false,
      stretch: true,
      toolbarHeight: kToolbarHeight,
      collapsedHeight: kToolbarHeight,
      stretchTriggerOffset: 100,
      expandedHeight: MediaQuery.sizeOf(context).height * .25,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: false,
        stretchModes: const [
          StretchMode.fadeTitle,
          StretchMode.blurBackground,
          StretchMode.zoomBackground,
        ],
        background: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
            ).copyWith(top: 30),
            child: GestureDetector(
              onTap: () {
                HapticFeedback.lightImpact();
                _controller.forward(from: 0.0);
              },
              child: FadeIn(
                delay: const Duration(milliseconds: 1500),
                duration: const Duration(seconds: 1),
                child:
                    Image.asset(
                          AppImages.loginImage,
                          // width: double.infinity,
                          // height: double.infinity,
                          // fit: BoxFit.fill,
                        )
                        .animate(controller: _controller, autoPlay: false)
                        .scale(
                          begin: const Offset(1, 1),
                          end: const Offset(1.12, 1.12),
                          duration: 120.ms,
                          curve: Curves.easeOutCubic,
                        )
                        .rotate(
                          begin: 0,
                          end: 0.02,
                          duration: 120.ms,
                          curve: Curves.easeOutCubic,
                        )
                        .then()
                        .scale(
                          begin: const Offset(1.12, 1.12),
                          end: const Offset(0.95, 0.95),
                          duration: 100.ms,
                          curve: Curves.easeInOutCubic,
                        )
                        .rotate(
                          begin: 0.02,
                          end: -0.02,
                          duration: 100.ms,
                          curve: Curves.easeInOutCubic,
                        )
                        .then()
                        .scale(
                          begin: const Offset(0.95, 0.95),
                          end: const Offset(1, 1),
                          duration: 100.ms,
                          curve: Curves.easeInCubic,
                        )
                        .rotate(
                          begin: -0.02,
                          end: 0,
                          duration: 100.ms,
                          curve: Curves.easeInCubic,
                        ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

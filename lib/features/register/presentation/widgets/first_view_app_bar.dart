import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:metw_go/core/utils/app_images.dart';

class FirstViewAppBar extends StatefulWidget {
  const FirstViewAppBar({super.key});

  @override
  State<FirstViewAppBar> createState() => _FirstViewAppBarState();
}

class _FirstViewAppBarState extends State<FirstViewAppBar>
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
      expandedHeight: MediaQuery.sizeOf(context).height * .20,
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
                _controller.forward(from: 0.0);
              },
              child: FadeIn(
                delay: Duration(milliseconds: 1500),
                duration: Duration(seconds: 1),
                child: Image.asset(AppImages.logo, width: 210, height: 350)
                    .animate(controller: _controller, autoPlay: false)
                    .scale(
                      begin: const Offset(1, 1),
                      end: const Offset(1.1, 1.1),
                      duration: 150.ms,
                      curve: Curves.easeOutBack,
                    )
                    .then()
                    .scale(
                      begin: const Offset(1.1, 1.1),
                      end: const Offset(1, 1),
                      duration: 150.ms,
                      curve: Curves.easeIn,
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

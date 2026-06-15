import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScreenWrapper extends StatelessWidget {
  const ScreenWrapper({
    this.applyAnnotation = true,
    super.key,
    required this.body,
    this.statusAppBarColor,
    this.backGroundColor,
    this.resizeToAvoidBottomInset,
    this.extendBodyBehindAppBar,
    this.floatingActionButton,
    this.onWillPop,
    this.appBar,
    this.bottomNavigationBar,
    this.onPopInvoked,
    this.drawer,
    this.backgroundImage,
    this.topSafeArea,
    this.opacity,
  });

  final Widget body;
  final Color? statusAppBarColor;
  final Color? backGroundColor;
  final bool? resizeToAvoidBottomInset;
  final bool? extendBodyBehindAppBar, topSafeArea;
  final Widget? floatingActionButton, drawer;
  final bool? onWillPop, applyAnnotation;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final void Function(bool)? onPopInvoked;
  final DecorationImage? backgroundImage;
  final double? opacity;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: onWillPop ?? true,
      onPopInvoked: onPopInvoked,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: MediaQuery(
          data: MediaQuery.of(
            context,
          ).copyWith(textScaler: const TextScaler.linear(1)),
          child: Scaffold(
            // extendBody: true,
            backgroundColor:
                backGroundColor ?? Theme.of(context).scaffoldBackgroundColor,
            drawer: drawer,
            bottomNavigationBar: bottomNavigationBar,
            appBar: appBar,
            floatingActionButton: floatingActionButton,
            extendBodyBehindAppBar: extendBodyBehindAppBar ?? false,
            resizeToAvoidBottomInset: resizeToAvoidBottomInset ?? false,
            body: 
            // applyAnnotation!? 
                AnnotatedRegion(
                    value: const SystemUiOverlayStyle(
                      statusBarBrightness: Brightness.light,
                      statusBarIconBrightness: Brightness.dark,
                    ),
                    child: SafeArea(
                      top: topSafeArea ?? false,
                      left: false,
                      bottom: false,
                      right: false,
                      child: body,
                    ),
                  )
                // : Stack(
                //     fit: StackFit.expand,
                //     children: [
                //       backgroundImage != null
                //           ? Container(
                //               height: double.infinity,
                //               width: double.infinity,
                //               foregroundDecoration: BoxDecoration(
                //                 color: Colors.white.withValues(
                //                   alpha: opacity ?? 0.8,
                //                 ),
                //               ),

                //               decoration: BoxDecoration(image: backgroundImage),
                //             )
                //           : const SizedBox(),

                //       body,
                //     ],
                //   ),
          ),
        ),
      ),
    );
  }
}

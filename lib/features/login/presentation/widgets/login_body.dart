import 'package:flutter/material.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key, required this.body});
  final Widget body;
  // final bool animate;

  @override
  Widget build(BuildContext context) {
    Widget content = Container(
      clipBehavior: Clip.antiAlias,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.only(
          topEnd: Radius.circular(100),
        ),
        color: Theme.of(context).colorScheme.surface,
      ),
      child: body,
    );

    // if (animate) {
    //   content = content
    //       .animate()
    //       .fade(delay: 500.ms, duration: 600.ms)
    //       .slide(
    //         begin: Offset(
    //           Directionality.of(context) == TextDirection.rtl ? -0.8 : 0.8,
    //           0.8,
    //         ),
    //         end: Offset.zero,
    //         delay: 300.ms,
    //         duration: 900.ms,
    //       );
    // }

    return SliverFillRemaining(hasScrollBody: false, child: content);
  }
}

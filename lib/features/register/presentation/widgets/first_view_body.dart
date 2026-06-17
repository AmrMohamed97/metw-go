import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class FirstViewBody extends StatelessWidget {
  const FirstViewBody({super.key, required this.body, this.animate = false});
  final Widget body;
  final bool animate;
  
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
      child: animate 
          ? FadeIn(
              delay: Duration(milliseconds: 1500),
              duration: Duration(seconds: 1),
              child: body,
            )
          : body,
    );

    if (animate) {
      content = content
          .animate()
          .fade(delay: 500.ms, duration: 600.ms)
          .slide(
            begin: Offset(
              Directionality.of(context) == TextDirection.rtl ? -0.8 : 0.8,
              0.8,
            ),
            end: Offset.zero,
            delay: 300.ms,
            duration: 900.ms,
          );
    }

    return SliverToBoxAdapter(
      child: content,
    );
  }
}

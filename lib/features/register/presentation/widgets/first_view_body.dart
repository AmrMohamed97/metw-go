import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class FirstViewBody extends StatelessWidget {
  const FirstViewBody({super.key, required this.body});
  final Widget body;
  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child:
          Container(
                clipBehavior: Clip.antiAlias,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.only(
                    topEnd: Radius.circular(100),
                  ),
                  color: Theme.of(context).colorScheme.surface,
                ),
                child: body,
              )
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
              ),
    );
  }
}

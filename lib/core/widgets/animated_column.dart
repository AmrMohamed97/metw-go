import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AnimatedColumn extends StatelessWidget {
  const AnimatedColumn({
    super.key,
    this.duration,
    this.horizontalOffset,
    required this.children,   this.crossAxisAlignment,
  });
  final Duration? duration;
  final double? horizontalOffset;
  final List<Widget> children;
  final CrossAxisAlignment? crossAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: Column(
        crossAxisAlignment: crossAxisAlignment ?? .start,
        children: AnimationConfiguration.toStaggeredList(
          duration: duration ?? const Duration(milliseconds: 800),
          childAnimationBuilder: (widget) => SlideAnimation(
            horizontalOffset: horizontalOffset ?? 50.0,
            child: FadeInAnimation(child: widget),
          ),
          children: children,
        ),
      ),
    );
  }
}

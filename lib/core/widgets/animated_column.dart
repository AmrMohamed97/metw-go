import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AnimatedColumn extends StatelessWidget {
  const AnimatedColumn({
    super.key,
    this.duration,
    this.verticalOffset = 30.0,
    this.horizontalOffset,
    required this.children,
    this.crossAxisAlignment,
    this.revealOnScroll = false,
  });

  final Duration? duration;
  final double? verticalOffset;
  final double? horizontalOffset;
  final List<Widget> children;
  final CrossAxisAlignment? crossAxisAlignment;
  final bool revealOnScroll;

  @override
  Widget build(BuildContext context) {
    if (revealOnScroll) {
      return Column(
        crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
        children: children
            .map((child) => ScrollReveal(
                  duration: duration ?? const Duration(milliseconds: 500),
                  verticalOffset: verticalOffset ?? 30.0,
                  child: child,
                ))
            .toList(),
      );
    }

    return AnimationLimiter(
      child: Column(
        crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
        children: AnimationConfiguration.toStaggeredList(
          duration: duration ?? const Duration(milliseconds: 500),
          childAnimationBuilder: (widget) => SlideAnimation(
            verticalOffset: verticalOffset,
            horizontalOffset: horizontalOffset,
            child: FadeInAnimation(child: widget),
          ),
          children: children,
        ),
      ),
    );
  }
}

class ScrollReveal extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final double verticalOffset;

  const ScrollReveal({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 500),
    this.verticalOffset = 30.0,
  });

  @override
  State<ScrollReveal> createState() => _ScrollRevealState();
}

class _ScrollRevealState extends State<ScrollReveal>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fadeAnimation;
  late final Animation<double> _slideAnimation;
  bool _isVisible = false;
  ScrollableState? _scrollable;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
    _slideAnimation =
        Tween<double>(begin: widget.verticalOffset, end: 0.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _scrollable = Scrollable.maybeOf(context);
    _scrollable?.position.addListener(_checkVisibility);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkVisibility();
      // Account for any parent entrance animations (slide/fade-in)
      Future.delayed(const Duration(milliseconds: 600), _checkVisibility);
      Future.delayed(const Duration(milliseconds: 1200), _checkVisibility);
      Future.delayed(const Duration(milliseconds: 1800), _checkVisibility);
      Future.delayed(const Duration(milliseconds: 2400), _checkVisibility);
    });
  }

  @override
  void dispose() {
    _scrollable?.position.removeListener(_checkVisibility);
    _controller.dispose();
    super.dispose();
  }

  void _checkVisibility() {
    if (!mounted) return;

    final RenderObject? renderObject = context.findRenderObject();
    if (renderObject == null || !renderObject.attached) return;

    final RenderBox box = renderObject as RenderBox;
    final position = box.localToGlobal(Offset.zero);
    final screenHeight = MediaQuery.sizeOf(context).height;

    if (position.dy < screenHeight - 30) {
      if (!_isVisible) {
        setState(() {
          _isVisible = true;
        });
        _controller.forward();
      }
    } else {
      if (_isVisible) {
        setState(() {
          _isVisible = false;
        });
        _controller.reset();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Opacity(
          opacity: _fadeAnimation.value,
          child: Transform.translate(
            offset: Offset(0, _slideAnimation.value),
            child: child,
          ),
        );
      },
      child: widget.child,
    );
  }
}

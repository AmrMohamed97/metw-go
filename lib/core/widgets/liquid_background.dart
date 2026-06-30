import 'package:flutter/material.dart';

import '../theme/my_colors.dart';

class LiquidBackground extends StatelessWidget {
  final Widget child;

  const LiquidBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background elements
        RepaintBoundary(
          child: Stack(
            children: [
              // Base dark background
              Container(color: Theme.of(context).colorScheme.onSurface),
              // Ambient Background Gradient 1
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      center: const Alignment(-0.8, -0.8),
                      radius: 1.5,
                      colors: [
                        MyColors.primaryColor.withValues(alpha: 0.15),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
              // Ambient Background Gradient 2
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      center: const Alignment(0.8, 0.8),
                      radius: 1.5,
                      colors: [
                        Theme.of(
                          context,
                        ).colorScheme.secondary.withValues(alpha: 0.1),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // Content
        SafeArea(child: child),
      ],
    );
  }
}

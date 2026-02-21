import 'dart:math';
import 'package:flutter/material.dart';
import '../models/app_theme_type.dart';
import '../services/theme_service.dart';

/// Renders floating gradient orbs behind glassmorphism theme content,
/// and a subtle radial wash for neumorphism. Other themes get no overlay.
class ThemeBackground extends StatelessWidget {
  final ThemeService themeService;
  final Widget child;

  const ThemeBackground({
    super.key,
    required this.themeService,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final type = themeService.current;

    return Stack(
      children: [
        if (type == AppThemeType.glassmorphism) const _GlassOrbs(),
        if (type == AppThemeType.neumorphism) _NeuWash(theme: Theme.of(context)),
        child,
      ],
    );
  }
}

class _GlassOrbs extends StatelessWidget {
  const _GlassOrbs();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Positioned.fill(
      child: IgnorePointer(
        child: Stack(
          children: [
            _Orb(
              color: const Color(0xFF667EEA),
              size: size.width * 0.45,
              left: -size.width * 0.1,
              top: size.height * 0.05,
            ),
            _Orb(
              color: const Color(0xFF764BA2),
              size: size.width * 0.35,
              left: size.width * 0.5,
              top: size.height * 0.2,
            ),
            _Orb(
              color: const Color(0xFFF093FB),
              size: size.width * 0.3,
              left: size.width * 0.15,
              top: size.height * 0.55,
            ),
          ],
        ),
      ),
    );
  }
}

class _Orb extends StatelessWidget {
  final Color color;
  final double size;
  final double left;
  final double top;

  const _Orb({
    required this.color,
    required this.size,
    required this.left,
    required this.top,
  });

  @override
  Widget build(BuildContext context) {
    final clamped = min(size, 500.0);
    return Positioned(
      left: left,
      top: top,
      child: Container(
        width: clamped,
        height: clamped,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [
              color.withValues(alpha: 0.35),
              color.withValues(alpha: 0.0),
            ],
          ),
        ),
      ),
    );
  }
}

class _NeuWash extends StatelessWidget {
  final ThemeData theme;
  const _NeuWash({required this.theme});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: IgnorePointer(
        child: Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: Alignment.topLeft,
              radius: 1.8,
              colors: [
                Colors.white.withValues(alpha: 0.25),
                theme.scaffoldBackgroundColor,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

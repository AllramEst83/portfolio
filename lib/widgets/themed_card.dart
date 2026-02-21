import 'dart:ui';
import 'package:flutter/material.dart';
import '../models/app_theme_type.dart';
import '../services/theme_service.dart';

class ThemedCard extends StatefulWidget {
  final Widget child;
  final ThemeService themeService;
  final EdgeInsetsGeometry? padding;

  const ThemedCard({
    super.key,
    required this.child,
    required this.themeService,
    this.padding,
  });

  @override
  State<ThemedCard> createState() => _ThemedCardState();
}

class _ThemedCardState extends State<ThemedCard> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final type = widget.themeService.current;
    final padding =
        widget.padding ?? const EdgeInsets.all(24);

    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOutCubic,
        transform: _hovering
            ? (Matrix4.identity()..scale(1.02))
            : Matrix4.identity(),
        transformAlignment: Alignment.center,
        child: _buildForTheme(type, theme, padding),
      ),
    );
  }

  Widget _buildForTheme(
      AppThemeType type, ThemeData theme, EdgeInsetsGeometry padding) {
    return switch (type) {
      AppThemeType.neoBrutalism => _neoBrutalCard(theme, padding),
      AppThemeType.neumorphism => _neuCard(theme, padding),
      AppThemeType.glassmorphism => _glassCard(theme, padding),
      AppThemeType.material => _materialCard(theme, padding),
    };
  }

  Widget _neoBrutalCard(ThemeData theme, EdgeInsetsGeometry padding) {
    final offset = _hovering ? const Offset(6, 6) : const Offset(4, 4);
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: padding,
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        border: Border.all(
          color: theme.colorScheme.onSurface,
          width: 3,
        ),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.onSurface,
            offset: offset,
          ),
        ],
      ),
      child: widget.child,
    );
  }

  Widget _neuCard(ThemeData theme, EdgeInsetsGeometry padding) {
    final bg = theme.scaffoldBackgroundColor;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: padding,
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withValues(alpha: 0.8),
            offset: const Offset(-6, -6),
            blurRadius: _hovering ? 16 : 12,
          ),
          BoxShadow(
            color: const Color(0xFFA3B1C6).withValues(alpha: 0.5),
            offset: const Offset(6, 6),
            blurRadius: _hovering ? 16 : 12,
          ),
        ],
      ),
      child: widget.child,
    );
  }

  Widget _glassCard(ThemeData theme, EdgeInsetsGeometry padding) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: padding,
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: _hovering ? 0.12 : 0.08),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.18),
            ),
          ),
          child: widget.child,
        ),
      ),
    );
  }

  Widget _materialCard(ThemeData theme, EdgeInsetsGeometry padding) {
    return Card(
      elevation: _hovering ? 8 : 2,
      child: Padding(
        padding: padding,
        child: widget.child,
      ),
    );
  }
}

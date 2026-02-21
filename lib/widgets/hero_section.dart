import 'package:flutter/material.dart';
import '../models/app_theme_type.dart';
import '../services/theme_service.dart';

class HeroSection extends StatelessWidget {
  final ThemeService themeService;

  const HeroSection({super.key, required this.themeService});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final isWide = MediaQuery.sizeOf(context).width > 700;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isWide ? 48 : 24,
        vertical: isWide ? 64 : 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _AnimatedTitle(themeService: themeService, theme: theme),
          const SizedBox(height: 12),
          Text(
            'The Binary Jazz Engineer',
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w700,
              color: cs.primary,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 20),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 640),
            child: Text(
              'Improvised logic, structured chaos, and high-performance execution. '
              '.NET fullstack developer who turns experiments into production.',
              style: theme.textTheme.bodyLarge?.copyWith(
                color: cs.onSurface.withValues(alpha: 0.72),
                height: 1.7,
              ),
            ),
          ),
          const SizedBox(height: 28),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              _SkillBadge(label: '.NET Core', theme: theme),
              _SkillBadge(label: 'Fullstack Web Development', theme: theme),
              _SkillBadge(label: 'App Experiments', theme: theme),
              _SkillBadge(label: 'JavaScript', theme: theme),
              _SkillBadge(label: 'TypeScript', theme: theme),
              _SkillBadge(label: 'HTML', theme: theme),
              _SkillBadge(label: 'CSS', theme: theme),
              _SkillBadge(label: 'SQL', theme: theme),
              _SkillBadge(label: 'Git', theme: theme),
              _SkillBadge(label: 'Azure Portal', theme: theme),
              _SkillBadge(label: 'SQL', theme: theme),
            ],
          ),
        ],
      ),
    );
  }
}

class _AnimatedTitle extends StatefulWidget {
  final ThemeService themeService;
  final ThemeData theme;

  const _AnimatedTitle({required this.themeService, required this.theme});

  @override
  State<_AnimatedTitle> createState() => _AnimatedTitleState();
}

class _AnimatedTitleState extends State<_AnimatedTitle>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _fade;
  late Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _fade = CurvedAnimation(parent: _ctrl, curve: Curves.easeOut);
    _slide = Tween(
      begin: const Offset(0, 0.15),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOutCubic));
    _ctrl.forward();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final type = widget.themeService.current;
    final isNeo = type == AppThemeType.neoBrutalism;

    return SlideTransition(
      position: _slide,
      child: FadeTransition(
        opacity: _fade,
        child: Text(
          'Kay Virgin Wiberg',
          style: widget.theme.textTheme.displaySmall?.copyWith(
            fontWeight: FontWeight.w900,
            letterSpacing: isNeo ? 2.0 : 0.5,
          ),
        ),
      ),
    );
  }
}

class _SkillBadge extends StatelessWidget {
  final String label;
  final ThemeData theme;

  const _SkillBadge({required this.label, required this.theme});

  @override
  Widget build(BuildContext context) {
    final cs = theme.colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: cs.secondary.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: cs.secondary.withValues(alpha: 0.3)),
      ),
      child: Text(
        label,
        style: theme.textTheme.labelMedium?.copyWith(
          color: cs.secondary,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

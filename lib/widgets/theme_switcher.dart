import 'package:flutter/material.dart';
import '../models/app_theme_type.dart';
import '../services/theme_service.dart';

class ThemeSwitcher extends StatelessWidget {
  final ThemeService themeService;

  const ThemeSwitcher({super.key, required this.themeService});

  static const _icons = {
    AppThemeType.neoBrutalism: Icons.format_bold,
    AppThemeType.neumorphism: Icons.blur_on,
    AppThemeType.glassmorphism: Icons.auto_awesome,
    AppThemeType.material: Icons.layers,
  };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final current = themeService.current;

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: AppThemeType.values.map((type) {
        final selected = type == current;
        return _ThemeChip(
          type: type,
          selected: selected,
          icon: _icons[type]!,
          theme: theme,
          onTap: () => themeService.setTheme(type),
        );
      }).toList(),
    );
  }
}

class _ThemeChip extends StatefulWidget {
  final AppThemeType type;
  final bool selected;
  final IconData icon;
  final ThemeData theme;
  final VoidCallback onTap;

  const _ThemeChip({
    required this.type,
    required this.selected,
    required this.icon,
    required this.theme,
    required this.onTap,
  });

  @override
  State<_ThemeChip> createState() => _ThemeChipState();
}

class _ThemeChipState extends State<_ThemeChip> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final cs = widget.theme.colorScheme;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOutCubic,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: widget.selected
                ? cs.primary
                : _hovering
                    ? cs.primary.withValues(alpha: 0.12)
                    : Colors.transparent,
            borderRadius: BorderRadius.circular(
              widget.type == AppThemeType.neoBrutalism ? 0 : 12,
            ),
            border: Border.all(
              color: widget.selected ? cs.primary : cs.onSurface.withValues(alpha: 0.3),
              width: widget.type == AppThemeType.neoBrutalism ? 2 : 1,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                widget.icon,
                size: 16,
                color: widget.selected ? cs.onPrimary : cs.onSurface,
              ),
              const SizedBox(width: 6),
              Text(
                widget.type.label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight:
                      widget.selected ? FontWeight.w700 : FontWeight.w500,
                  color: widget.selected ? cs.onPrimary : cs.onSurface,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/project_model.dart';
import '../services/theme_service.dart';
import 'themed_card.dart';

class ProjectCard extends StatelessWidget {
  final ProjectModel project;
  final ThemeService themeService;

  const ProjectCard({
    super.key,
    required this.project,
    required this.themeService,
  });

  Future<void> _launch() async {
    final uri = Uri.parse(project.url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return ThemedCard(
      themeService: themeService,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: cs.primary.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(project.icon, color: cs.primary, size: 24),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  project.title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            project.description,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: cs.onSurface.withValues(alpha: 0.75),
              height: 1.5,
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: project.tags.map((tag) {
              return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: cs.tertiary.withValues(alpha: 0.18),
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color: cs.tertiary.withValues(alpha: 0.3),
                  ),
                ),
                child: Text(
                  tag,
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: cs.onSurface.withValues(alpha: 0.8),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 18),
          Align(
            alignment: Alignment.centerRight,
            child: _LaunchButton(onTap: _launch, theme: theme),
          ),
        ],
      ),
    );
  }
}

class _LaunchButton extends StatefulWidget {
  final VoidCallback onTap;
  final ThemeData theme;

  const _LaunchButton({required this.onTap, required this.theme});

  @override
  State<_LaunchButton> createState() => _LaunchButtonState();
}

class _LaunchButtonState extends State<_LaunchButton> {
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
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: _hovering ? cs.primary : cs.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'View Project',
                style: TextStyle(
                  color: _hovering ? cs.onPrimary : cs.primary,
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
              ),
              const SizedBox(width: 6),
              AnimatedSlide(
                duration: const Duration(milliseconds: 200),
                offset: _hovering ? const Offset(0.15, 0) : Offset.zero,
                child: Icon(
                  Icons.arrow_forward_rounded,
                  size: 16,
                  color: _hovering ? cs.onPrimary : cs.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/project_model.dart';
import '../services/theme_service.dart';
import '../widgets/glassmorphism_background.dart';

class ProjectDetailScreen extends StatelessWidget {
  final ProjectModel project;
  final ThemeService themeService;

  const ProjectDetailScreen({
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
    final width = MediaQuery.sizeOf(context).width;
    final isMobile = width < 600;
    final horizontalPadding = isMobile ? 20.0 : 48.0;

    return Scaffold(
      body: ThemeBackground(
        themeService: themeService,
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                floating: true,
                snap: true,
                toolbarHeight: 64,
                backgroundColor: theme.appBarTheme.backgroundColor,
                titleSpacing: 8,
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back_rounded),
                  onPressed: () => Navigator.of(context).pop(),
                  tooltip: 'Back to projects',
                ),
                title: Text(
                  project.title,
                  style: theme.appBarTheme.titleTextStyle,
                  overflow: TextOverflow.ellipsis,
                ),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.open_in_new_rounded),
                    tooltip: 'Open live project',
                    onPressed: _launch,
                  ),
                ],
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    horizontalPadding,
                    24,
                    horizontalPadding,
                    32,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: cs.primary.withValues(alpha: 0.12),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(
                              project.icon,
                              color: cs.primary,
                              size: 28,
                            ),
                          ),
                          const SizedBox(width: 18),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  project.title,
                                  style: theme.textTheme.headlineSmall
                                      ?.copyWith(fontWeight: FontWeight.w800),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  'Case study • ${Uri.parse(project.url).host}',
                                  style: theme.textTheme.labelLarge?.copyWith(
                                    color: cs.onSurface.withValues(alpha: 0.65),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Text(
                        project.longDescription ?? project.description,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: cs.onSurface.withValues(alpha: 0.8),
                          height: 1.7,
                        ),
                      ),
                      const SizedBox(height: 24),
                      if (project.tags.isNotEmpty) ...[
                        Text(
                          'Tech & keywords',
                          style: theme.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: project.tags
                              .map(
                                (tag) => Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color: cs.tertiary.withValues(alpha: 0.16),
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: cs.tertiary.withValues(alpha: 0.4),
                                    ),
                                  ),
                                  child: Text(
                                    tag,
                                    style: theme.textTheme.labelSmall?.copyWith(
                                      color: cs.onSurface.withValues(
                                        alpha: 0.85,
                                      ),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ],
                      const SizedBox(height: 32),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Wrap(
                          spacing: 12,
                          runSpacing: 8,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            TextButton.icon(
                              onPressed: () => Navigator.of(context).pop(),
                              icon: const Icon(
                                Icons.arrow_back_rounded,
                                size: 18,
                              ),
                              label: const Text('Back to portfolio'),
                            ),
                            FilledButton.icon(
                              onPressed: _launch,
                              icon: const Icon(
                                Icons.open_in_new_rounded,
                                size: 18,
                              ),
                              label: const Text('Open live project'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

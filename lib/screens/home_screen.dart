import 'package:flutter/material.dart';
import '../models/project_model.dart';
import '../services/theme_service.dart';
import '../widgets/glassmorphism_background.dart';
import '../widgets/hero_section.dart';
import '../widgets/project_card.dart';
import '../widgets/theme_switcher.dart';

class HomeScreen extends StatelessWidget {
  final ThemeService themeService;

  const HomeScreen({super.key, required this.themeService});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final width = MediaQuery.sizeOf(context).width;
    final isWide = width > 700;
    final isDesktop = width > 1100;

    return Scaffold(
      body: ThemeBackground(
        themeService: themeService,
        child: CustomScrollView(
          slivers: [
            // ---------- App Bar ----------
            SliverAppBar(
              floating: true,
              snap: true,
              toolbarHeight: 64,
              backgroundColor: theme.appBarTheme.backgroundColor,
              titleSpacing: 16,
              title: Text(
                'CodedByKay Portfolio',
                style: theme.appBarTheme.titleTextStyle,
                overflow: TextOverflow.ellipsis,
              ),
              actions: [
                if (isWide)
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: ThemeSwitcher(themeService: themeService),
                  )
                else
                  IconButton(
                    icon: const Icon(Icons.palette_outlined),
                    tooltip: 'Switch theme',
                    onPressed: () => _showThemeSheet(context),
                  ),
              ],
            ),

            // ---------- Hero ----------
            SliverToBoxAdapter(child: HeroSection(themeService: themeService)),

            // ---------- Projects header ----------
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isWide ? 48 : 24,
                  vertical: 8,
                ),
                child: Text(
                  'Featured Projects',
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),

            // ---------- Projects ----------
            SliverPadding(
              padding: EdgeInsets.symmetric(
                horizontal: isWide ? 48 : 16,
                vertical: 16,
              ),
              sliver: isDesktop
                  ? SliverGrid(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 20,
                            mainAxisExtent: 280,
                          ),
                      delegate: SliverChildBuilderDelegate(
                        (context, i) => ProjectCard(
                          project: ProjectModel.featured[i],
                          themeService: themeService,
                        ),
                        childCount: ProjectModel.featured.length,
                      ),
                    )
                  : SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, i) => Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: ProjectCard(
                            project: ProjectModel.featured[i],
                            themeService: themeService,
                          ),
                        ),
                        childCount: ProjectModel.featured.length,
                      ),
                    ),
            ),

            // ---------- Footer ----------
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '© ${DateTime.now().year} CodedByKay — Binary Jazz Engineer',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: cs.onSurface.withValues(alpha: 0.45),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      SelectableText(
                        'If you are a recruiter, please contact me directly by email: kaywib@gmail.com',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: cs.onSurface.withValues(alpha: 0.5),
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showThemeSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Choose Theme',
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 16),
              ThemeSwitcher(themeService: themeService),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

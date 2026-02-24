import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
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
          const SizedBox(height: 24),
          _ContactRow(theme: theme),
          const SizedBox(height: 24),
          _SkillCategory(
            title: 'Software & editors',
            theme: theme,
            color: themeService.current == AppThemeType.material
                ? cs.tertiary
                : cs.onSurface.withValues(alpha: 0.78),
            skills: const [
              'Visual Studio',
              'VS Code',
              'Cursor',
              'Azure Data Studio',
              'SQL Server Management Studio',
              'LM Studio',
            ],
          ),
          const SizedBox(height: 28),
          _SkillCategory(
            title: 'Comfortable With',
            theme: theme,
            color: cs.secondary,
            skills: const [
              'Fullstack Web Development',
              '.NET Core',
              'ASP.NET Core',
              'ASP.NET MVC',
              'REST APIs (OpenAPI, Swagger)',
              'ASP.NET Razor Pages',
              'C#',
              'Entity Framework',
              'JavaScript',
              'TypeScript',
              'HTML',
              'CSS',
              'SQL',
              'Git',
              'Azure Portal',
              'Azure Cognitive Services',
              'Microsoft DevOps',
              'CI/CD (Azure DevOps, GitHub Actions)',
              'Gemini AI API',
              'OpenAI API',
            ],
          ),
          const SizedBox(height: 20),
          _SkillCategory(
            title: 'Explored & Experimenting',
            theme: theme,
            color: cs.primary,
            skills: const [
              '.NET MAUI',
              'Flutter',
              'Dart',
              'JetPack Compose',
              'React',
              'Vue',
              'Blazor',
              'Docker',
              'LM Studio',
            ],
          ),
        ],
      ),
    );
  }
}

/// Contact links — update email, LinkedIn, and GitHub URLs to your own.
class _ContactRow extends StatelessWidget {
  static const String _email = 'mailto:kaywib@gmail.com';
  static const String _linkedIn =
      'https://www.linkedin.com/in/kay-virgin-wiberg-126407124';
  static const String _github = 'https://github.com/AllramEst83';

  final ThemeData theme;

  const _ContactRow({required this.theme});

  Future<void> _launch(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20,
      runSpacing: 12,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        _ContactChip(
          icon: Icons.email_outlined,
          label: 'Email',
          onTap: () => _launch(_email),
          theme: theme,
        ),
        _ContactChip(
          icon: Icons.link,
          label: 'LinkedIn',
          onTap: () => _launch(_linkedIn),
          theme: theme,
        ),
        _ContactChip(
          icon: Icons.code,
          label: 'GitHub',
          onTap: () => _launch(_github),
          theme: theme,
        ),
      ],
    );
  }
}

class _ContactChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final ThemeData theme;

  const _ContactChip({
    required this.icon,
    required this.label,
    required this.onTap,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    final cs = theme.colorScheme;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 18, color: cs.primary),
              const SizedBox(width: 8),
              Text(
                label,
                style: theme.textTheme.labelLarge?.copyWith(
                  color: cs.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
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

class _SkillCategory extends StatelessWidget {
  final String title;
  final ThemeData theme;
  final Color color;
  final List<String> skills;

  const _SkillCategory({
    required this.title,
    required this.theme,
    required this.color,
    required this.skills,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.textTheme.titleSmall?.copyWith(
            color: color,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: skills
              .map((s) => _SkillBadge(label: s, theme: theme, color: color))
              .toList(),
        ),
      ],
    );
  }
}

class _SkillBadge extends StatelessWidget {
  final String label;
  final ThemeData theme;
  final Color color;

  const _SkillBadge({
    required this.label,
    required this.theme,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Text(
        label,
        style: theme.textTheme.labelMedium?.copyWith(
          color: color,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

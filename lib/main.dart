import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:go_router/go_router.dart';

import 'models/project_model.dart';
import 'screens/home_screen.dart';
import 'screens/project_detail_screen.dart';
import 'services/theme_service.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());
  runApp(const BinaryJazzApp());
}

class BinaryJazzApp extends StatefulWidget {
  const BinaryJazzApp({super.key});

  @override
  State<BinaryJazzApp> createState() => _BinaryJazzAppState();
}

class _BinaryJazzAppState extends State<BinaryJazzApp> {
  final _themeService = ThemeService();
  late final GoRouter _router;

  @override
  void initState() {
    super.initState();
    _themeService.addListener(_onThemeChange);
    _router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => HomeScreen(themeService: _themeService),
          routes: [
            GoRoute(
              path: 'projects/:slug',
              builder: (context, state) {
                final slug = state.pathParameters['slug']!;
                final project = ProjectModel.fromSlug(slug);
                if (project == null) {
                  return HomeScreen(themeService: _themeService);
                }
                return ProjectDetailScreen(
                  project: project,
                  themeService: _themeService,
                );
              },
            ),
          ],
        ),
      ],
    );
  }

  void _onThemeChange() => setState(() {});

  @override
  void dispose() {
    _themeService.removeListener(_onThemeChange);
    _themeService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Portfolio',
      debugShowCheckedModeBanner: false,
      theme: _themeService.themeData,
      themeAnimationDuration: const Duration(milliseconds: 400),
      themeAnimationCurve: Curves.easeInOutCubic,
      routerConfig: _router,
    );
  }
}

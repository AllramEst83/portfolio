import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'services/theme_service.dart';

void main() {
  runApp(const BinaryJazzApp());
}

class BinaryJazzApp extends StatefulWidget {
  const BinaryJazzApp({super.key});

  @override
  State<BinaryJazzApp> createState() => _BinaryJazzAppState();
}

class _BinaryJazzAppState extends State<BinaryJazzApp> {
  final _themeService = ThemeService();

  @override
  void initState() {
    super.initState();
    _themeService.addListener(_onThemeChange);
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
    return MaterialApp(
      title: 'Portfolio',
      debugShowCheckedModeBanner: false,
      theme: _themeService.themeData,
      themeAnimationDuration: const Duration(milliseconds: 400),
      themeAnimationCurve: Curves.easeInOutCubic,
      home: HomeScreen(themeService: _themeService),
    );
  }
}

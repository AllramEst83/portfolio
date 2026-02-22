import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/app_theme_type.dart';

class ThemeService extends ChangeNotifier {
  AppThemeType _current = AppThemeType.neoBrutalism;

  AppThemeType get current => _current;

  void setTheme(AppThemeType type) {
    if (_current == type) return;
    _current = type;
    notifyListeners();
  }

  ThemeData get themeData => switch (_current) {
        AppThemeType.neoBrutalism => _neoBrutalism,
        AppThemeType.neumorphism => _neumorphism,
        AppThemeType.glassmorphism => _glassmorphism,
        AppThemeType.material => _materialTheme,
      };

  // ---------------------------------------------------------------------------
  // Neo-Brutalism
  // ---------------------------------------------------------------------------
  ThemeData get _neoBrutalism {
    const primary = Color(0xFFFF6B6B);
    const surface = Color(0xFFFFF9E6);
    const onSurface = Color(0xFF1A1A2E);

    return ThemeData(
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
        primary: primary,
        secondary: Color(0xFF4ECDC4),
        tertiary: Color(0xFFFFE66D),
        surface: surface,
        onPrimary: onSurface,
        onSecondary: onSurface,
        onSurface: onSurface,
      ),
      scaffoldBackgroundColor: surface,
      textTheme: GoogleFonts.spaceMonoTextTheme().apply(
        bodyColor: onSurface,
        displayColor: onSurface,
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
          side: const BorderSide(color: onSurface, width: 3),
        ),
        color: surface,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: onSurface,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
            side: const BorderSide(color: onSurface, width: 3),
          ),
          textStyle: GoogleFonts.spaceMono(
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: surface,
        foregroundColor: onSurface,
        elevation: 0,
        titleTextStyle: GoogleFonts.spaceMono(
          color: onSurface,
          fontWeight: FontWeight.w700,
          fontSize: 20,
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Neumorphism — cool slate/blue monochrome
  // primary on bg ≈ 5.8:1, secondary on bg ≈ 8.6:1 (WCAG AA+)
  // ---------------------------------------------------------------------------
  ThemeData get _neumorphism {
    const bg = Color(0xFFE0E5EC);
    const onBg = Color(0xFF1A202C);
    const primary = Color(0xFFCF6B5E);
    const secondary = Color(0xFF3D7A9E);

    return ThemeData(
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
        primary: primary,
        secondary: secondary,
        tertiary: Color(0xFFBCC8D6),
        surface: bg,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: onBg,
      ),
      scaffoldBackgroundColor: bg,
      textTheme: GoogleFonts.poppinsTextTheme().apply(
        bodyColor: onBg,
        displayColor: onBg,
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: bg,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: bg,
          foregroundColor: onBg,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: bg,
        foregroundColor: onBg,
        elevation: 0,
        titleTextStyle: GoogleFonts.poppins(
          color: onBg,
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Glassmorphism
  // ---------------------------------------------------------------------------
  ThemeData get _glassmorphism {
    const primary = Color(0xFF667EEA);
    const onSurface = Colors.white;

    return ThemeData(
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(
        primary: primary,
        secondary: Color(0xFF764BA2),
        tertiary: Color(0xFFF093FB),
        surface: Color(0xFF1A1A2E),
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: onSurface,
      ),
      scaffoldBackgroundColor: const Color(0xFF0F0F23),
      textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme).apply(
        bodyColor: onSurface,
        displayColor: onSurface,
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: Colors.white.withValues(alpha: 0.15)),
        ),
        color: Colors.white.withValues(alpha: 0.08),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary.withValues(alpha: 0.6),
          foregroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: Colors.white.withValues(alpha: 0.2)),
          ),
          textStyle: GoogleFonts.inter(
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        foregroundColor: onSurface,
        elevation: 0,
        titleTextStyle: GoogleFonts.inter(
          color: onSurface,
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Material Design — warm teal, distinct from Neumorphism's cool blues
  // ---------------------------------------------------------------------------
  ThemeData get _materialTheme {
    final base = ColorScheme.fromSeed(
      seedColor: const Color(0xFF00796B),
      brightness: Brightness.light,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: base,
      scaffoldBackgroundColor: base.surface,
      textTheme: GoogleFonts.robotoTextTheme().apply(
        bodyColor: base.onSurface,
        displayColor: base.onSurface,
      ),
      cardTheme: CardThemeData(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: GoogleFonts.roboto(
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: base.surface,
        foregroundColor: base.onSurface,
        elevation: 0,
        titleTextStyle: GoogleFonts.roboto(
          color: base.onSurface,
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),
      ),
    );
  }
}

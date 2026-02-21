enum AppThemeType {
  neoBrutalism,
  neumorphism,
  glassmorphism,
  material,
}

extension AppThemeTypeX on AppThemeType {
  String get label => switch (this) {
        AppThemeType.neoBrutalism => 'Neo-Brutalism',
        AppThemeType.neumorphism => 'Neumorphism',
        AppThemeType.glassmorphism => 'Glassmorphism',
        AppThemeType.material => 'Material',
      };
}

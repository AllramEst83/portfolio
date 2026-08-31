export const ThemeType = Object.freeze({
  NEO_BRUTALISM: 'neo-brutalism',
  NEUMORPHISM: 'neumorphism',
  GLASSMORPHISM: 'glassmorphism',
  MATERIAL: 'material',
});

export const THEME_ORDER = Object.freeze([
  ThemeType.NEO_BRUTALISM,
  ThemeType.NEUMORPHISM,
  ThemeType.GLASSMORPHISM,
  ThemeType.MATERIAL,
]);

export const THEME_LABELS = Object.freeze({
  [ThemeType.NEO_BRUTALISM]: 'Neo-Brutalism',
  [ThemeType.NEUMORPHISM]: 'Neumorphism',
  [ThemeType.GLASSMORPHISM]: 'Glassmorphism',
  [ThemeType.MATERIAL]: 'Material',
});

export const THEME_ICONS = Object.freeze({
  [ThemeType.NEO_BRUTALISM]: 'format_bold',
  [ThemeType.NEUMORPHISM]: 'blur_on',
  [ThemeType.GLASSMORPHISM]: 'auto_awesome',
  [ThemeType.MATERIAL]: 'layers',
});

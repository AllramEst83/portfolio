import { el, icon, clear } from '../utils/dom.js';
import { THEME_ORDER, THEME_LABELS, THEME_ICONS } from '../models/ThemeType.js';

/** A row of theme chips; highlights the active theme and stays in sync with ThemeService. */
export class ThemeSwitcher {
  constructor(themeService, { onSelect } = {}) {
    this.themeService = themeService;
    this.onSelect = onSelect;
    this.element = el('div', { class: 'theme-switcher', role: 'group', 'aria-label': 'Choose theme' });

    this._handleChange = () => this._render();
    this.themeService.addEventListener('change', this._handleChange);
    this._render();
  }

  _render() {
    clear(this.element);
    const current = this.themeService.current;

    for (const type of THEME_ORDER) {
      const selected = type === current;
      this.element.append(
        el(
          'button',
          {
            type: 'button',
            class: `theme-chip theme-chip--${type}${selected ? ' is-selected' : ''}`,
            'aria-pressed': String(selected),
            onclick: () => {
              this.themeService.setTheme(type);
              this.onSelect?.(type);
            },
          },
          [icon(THEME_ICONS[type], { class: 'theme-chip__icon' }), el('span', {}, THEME_LABELS[type])],
        ),
      );
    }
  }

  destroy() {
    this.themeService.removeEventListener('change', this._handleChange);
  }
}

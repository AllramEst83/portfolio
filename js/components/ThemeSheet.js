import { el } from '../utils/dom.js';
import { ThemeSwitcher } from './ThemeSwitcher.js';

/** Mobile bottom-sheet equivalent of Flutter's showModalBottomSheet theme picker. */
export class ThemeSheet {
  constructor(themeService) {
    this.themeService = themeService;
    this._switcher = new ThemeSwitcher(themeService, { onSelect: () => this.close() });

    this._handleKeydown = (event) => {
      if (event.key === 'Escape') this.close();
    };

    this.overlay = el(
      'div',
      { class: 'theme-sheet-overlay', hidden: true, onclick: (e) => e.target === this.overlay && this.close() },
      [
        el('div', { class: 'theme-sheet', role: 'dialog', 'aria-modal': 'true', 'aria-label': 'Choose theme' }, [
          el('div', { class: 'theme-sheet__header' }, [
            el('h2', { class: 'theme-sheet__title' }, 'Choose Theme'),
            el(
              'button',
              { type: 'button', class: 'theme-sheet__close', 'aria-label': 'Close', onclick: () => this.close() },
              '✕',
            ),
          ]),
          this._switcher.element,
        ]),
      ],
    );
  }

  open() {
    this.overlay.hidden = false;
    document.addEventListener('keydown', this._handleKeydown);
  }

  close() {
    this.overlay.hidden = true;
    document.removeEventListener('keydown', this._handleKeydown);
  }
}

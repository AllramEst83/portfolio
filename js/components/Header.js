import { el, icon } from '../utils/dom.js';
import { ThemeSwitcher } from './ThemeSwitcher.js';
import { ThemeSheet } from './ThemeSheet.js';

const WIDE_BREAKPOINT = 850;

/** Sticky app bar: inline theme switcher on wide viewports, a sheet trigger below it. */
export class Header {
  constructor(themeService) {
    this.themeService = themeService;
    this.sheet = new ThemeSheet(themeService);
    this.inlineSwitcher = new ThemeSwitcher(themeService);

    this.mobileToggle = el(
      'button',
      {
        type: 'button',
        class: 'icon-button header__theme-toggle',
        'aria-label': 'Switch theme',
        title: 'Switch theme',
        onclick: () => this.sheet.open(),
      },
      [icon('palette')],
    );

    this.element = el('header', { class: 'app-header' }, [
      el('div', { class: 'app-header__inner' }, [
        el('span', { class: 'app-header__title' }, 'CodedByKay Portfolio'),
        el('div', { class: 'app-header__actions' }, [
          el('div', { class: 'app-header__inline-switcher' }, [this.inlineSwitcher.element]),
          this.mobileToggle,
        ]),
      ]),
    ]);

    this._syncResponsiveMode();
    window.addEventListener('resize', () => this._syncResponsiveMode());
  }

  _syncResponsiveMode() {
    const isWide = window.innerWidth > WIDE_BREAKPOINT;
    this.element.classList.toggle('app-header--wide', isWide);
  }

  mount(root) {
    root.append(this.element, this.sheet.overlay);
  }
}

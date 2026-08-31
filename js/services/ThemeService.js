import { ThemeType } from '../models/ThemeType.js';

const STORAGE_KEY = 'portfolio:theme';

/**
 * Holds the active visual theme and notifies listeners on change.
 * Mirrors the Flutter app's ChangeNotifier-based ThemeService.
 */
export class ThemeService extends EventTarget {
  #current;

  constructor() {
    super();
    this.#current = readStoredTheme() ?? ThemeType.NEO_BRUTALISM;
  }

  get current() {
    return this.#current;
  }

  setTheme(type) {
    if (type === this.#current) return;
    this.#current = type;
    persistTheme(type);
    this.dispatchEvent(new CustomEvent('change', { detail: this.#current }));
  }
}

function readStoredTheme() {
  try {
    const value = localStorage.getItem(STORAGE_KEY);
    return Object.values(ThemeType).includes(value) ? value : null;
  } catch {
    return null;
  }
}

function persistTheme(type) {
  try {
    localStorage.setItem(STORAGE_KEY, type);
  } catch {
    // Storage unavailable (private browsing, quota, etc.) — theme just won't persist.
  }
}

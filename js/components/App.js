import { ThemeService } from '../services/ThemeService.js';
import { PROJECTS } from '../models/Project.js';
import { el } from '../utils/dom.js';
import { Header } from './Header.js';
import { renderHeroSection } from './HeroSection.js';
import { renderProjectList } from './ProjectList.js';
import { renderFooter } from './Footer.js';

/** Top-level orchestrator: owns the ThemeService and mounts every section. */
export class App {
  constructor(root) {
    this.root = root;
    this.themeService = new ThemeService();
    this.themeService.addEventListener('change', () => this._applyTheme());
  }

  mount() {
    this._applyTheme();

    const header = new Header(this.themeService);
    header.mount(this.root);

    this.root.append(
      el('main', { class: 'app-main' }, [
        renderHeroSection(),
        renderProjectList(PROJECTS),
      ]),
      renderFooter(),
    );
  }

  _applyTheme() {
    document.documentElement.dataset.theme = this.themeService.current;
  }
}

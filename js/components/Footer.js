import { el } from '../utils/dom.js';

export function renderFooter() {
  const year = new Date().getFullYear();
  return el('footer', { class: 'app-footer' }, [
    el('p', { class: 'app-footer__copyright' }, `© ${year} CodedByKay — Binary Jazz Engineer`),
    el(
      'p',
      { class: 'app-footer__contact' },
      'If you are a recruiter, please contact me directly by email: kaywib@gmail.com',
    ),
  ]);
}

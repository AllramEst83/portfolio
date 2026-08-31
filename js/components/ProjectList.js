import { el } from '../utils/dom.js';
import { renderProjectCard } from './ProjectCard.js';

export function renderProjectList(projects) {
  return el('section', { class: 'projects', 'aria-label': 'Featured projects' }, [
    el('h2', { class: 'projects__heading' }, 'Featured Projects'),
    el(
      'div',
      { class: 'projects__grid' },
      projects.map((project) => renderProjectCard(project)),
    ),
  ]);
}

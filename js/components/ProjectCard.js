import { el, icon } from '../utils/dom.js';

/**
 * Renders full project details inline (icon, domain, long description, tags,
 * live link) — there is no separate project detail page in this app.
 */
export function renderProjectCard(project) {
  return el('article', { class: 'project-card' }, [
    el('div', { class: 'project-card__header' }, [
      el('div', { class: 'project-card__icon' }, [icon(project.icon)]),
      el('div', { class: 'project-card__heading' }, [
        el('h3', { class: 'project-card__title' }, project.title),
        el('p', { class: 'project-card__domain' }, `Project • ${project.domain}`),
      ]),
    ]),
    el('p', { class: 'project-card__description' }, project.details),
    project.tags.length > 0 &&
      el(
        'div',
        { class: 'project-card__tags' },
        project.tags.map((tag) => el('span', { class: 'tag' }, tag)),
      ),
    el('div', { class: 'project-card__footer' }, [
      el(
        'a',
        {
          class: 'project-card__launch',
          href: project.url,
          target: '_blank',
          rel: 'noopener noreferrer',
        },
        [
          el('span', {}, 'View live project'),
          icon('arrow_forward', { class: 'project-card__launch-icon' }),
        ],
      ),
    ]),
  ]);
}

import { el, icon } from '../utils/dom.js';

const CONTACT_LINKS = [
  { icon: 'email', label: 'Email', href: 'mailto:kaywib@gmail.com' },
  { icon: 'link', label: 'LinkedIn', href: 'https://www.linkedin.com/in/kay-virgin-wiberg-126407124' },
  { icon: 'code', label: 'GitHub', href: 'https://github.com/AllramEst83' },
];

const SKILL_CATEGORIES = [
  {
    title: 'Software & editors',
    variant: 'muted',
    skills: ['Visual Studio', 'Visual Studio Code', 'Azure Data Studio', 'SQL Server Management Studio'],
  },
  {
    title: 'Comfortable With',
    variant: 'secondary',
    groups: [
      {
        subtitle: 'Backend & Cloud',
        skills: [
          '.NET Core',
          'ASP.NET Core',
          'ASP.NET MVC',
          'ASP.NET Razor Pages',
          'C#',
          'Entity Framework',
          'MSSQL',
          'REST APIs (OpenAPI, Swagger)',
          'Azure Portal',
          'Azure Cognitive Services',
          'CI/CD (Azure DevOps, GitHub Actions)',
          'Microsoft DevOps',
          'Docker'
        ],
      },
      {
        subtitle: 'Frontend',
        skills: ['JavaScript','TypeScript', 'Vue', 'React'],
      },
      {
        subtitle: 'AI Integration',
        skills: ['Gemini AI API', 'OpenAI API', 'Azure OpenAI Service', 'Ollama'],
      }
    ],
  },
  {
    title: 'Explored & Experimenting',
    variant: 'primary',
    skills: ['Blazor', 'Flutter', '.NET MAUI', 'LM Studio'],
  },
];

function contactChip({ icon: iconName, label, href }) {
  return el('a', { class: 'contact-chip', href, target: '_blank', rel: 'noopener noreferrer' }, [
    icon(iconName, { class: 'contact-chip__icon' }),
    el('span', {}, label),
  ]);
}

function skillBadge(label, variant) {
  return el('span', { class: `skill-badge skill-badge--${variant}` }, label);
}

function skillBadges(skills, variant) {
  return el(
    'div',
    { class: 'skill-category__badges' },
    skills.map((skill) => skillBadge(skill, variant)),
  );
}

function skillSubgroup({ subtitle, skills }, variant) {
  return el('div', { class: 'skill-subgroup' }, [
    el('h4', { class: 'skill-subgroup__title' }, subtitle),
    skillBadges(skills, variant),
  ]);
}

function skillCategory({ title, variant, skills, groups }) {
  return el('div', { class: 'skill-category' }, [
    el('h3', { class: `skill-category__title skill-category__title--${variant}` }, title),
    groups
      ? el(
          'div',
          { class: 'skill-category__groups' },
          groups.map((group) => skillSubgroup(group, variant)),
        )
      : skillBadges(skills, variant),
  ]);
}

export function renderHeroSection() {
  return el('section', { class: 'hero' }, [
    el('h1', { class: 'hero__name' }, 'Kay Virgin Wiberg'),
    el('p', { class: 'hero__tagline' }, 'The Binary Jazz Engineer'),
    el(
      'p',
      { class: 'hero__summary' },
      'Improvised logic, structured chaos, and high-performance execution. ' +
        '.NET fullstack developer who turns experiments into production.',
    ),
    el(
      'div',
      { class: 'contact-row' },
      CONTACT_LINKS.map(contactChip),
    ),
    el(
      'div',
      { class: 'hero__skills' },
      SKILL_CATEGORIES.map(skillCategory),
    ),
  ]);
}

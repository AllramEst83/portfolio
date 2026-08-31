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
    skills: [
      'Visual Studio',
      'VS Code',
      'Cursor',
      'Azure Data Studio',
      'SQL Server Management Studio',
      'LM Studio',
    ],
  },
  {
    title: 'Comfortable With',
    variant: 'secondary',
    skills: [
      'Fullstack Web Development',
      '.NET Core',
      'ASP.NET Core',
      'ASP.NET MVC',
      'REST APIs (OpenAPI, Swagger)',
      'ASP.NET Razor Pages',
      'C#',
      'Entity Framework',
      'JavaScript',
      'TypeScript',
      'HTML',
      'CSS',
      'MSSQL',
      'Git',
      'Azure Portal',
      'Azure Cognitive Services',
      'Microsoft DevOps',
      'CI/CD (Azure DevOps, GitHub Actions)',
      'Gemini AI API',
      'OpenAI API',
    ],
  },
  {
    title: 'Explored & Experimenting',
    variant: 'primary',
    skills: [
      '.NET MAUI',
      'Flutter',
      'Dart',
      'JetPack Compose',
      'Kotlin',
      'React',
      'Vue',
      'Angular (Way back)',
      'Blazor',
      'Docker',
      'LM Studio',
    ],
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

function skillCategory({ title, variant, skills }) {
  return el('div', { class: 'skill-category' }, [
    el('h3', { class: `skill-category__title skill-category__title--${variant}` }, title),
    el(
      'div',
      { class: 'skill-category__badges' },
      skills.map((skill) => skillBadge(skill, variant)),
    ),
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

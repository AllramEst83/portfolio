# Portfolio

CodedByKay's portfolio — "Improvised logic, structured chaos, and high-performance execution."

A static site built with vanilla ECMAScript (modules and classes) and CSS — no build step,
no framework, and no bundler required.

## Structure

- `index.html` — page shell and metadata
- `css/base.css` — layout and component structure
- `css/themes.css` — the four visual identities (Neo-Brutalism, Neumorphism, Glassmorphism, Material),
  toggled via a `data-theme` attribute on `<html>`
- `js/models/` — `Project` and `ThemeType` data
- `js/services/ThemeService.js` — active-theme state and persistence (`localStorage`)
- `js/components/` — DOM-building classes/functions for the header, hero, project cards, and footer
- `js/main.js` — entry point

## Running locally

Any static file server works, e.g.:

```sh
npx serve .
```

Then open the printed local URL.

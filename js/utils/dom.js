/**
 * Minimal hyperscript-style DOM builder. `children` items may be Nodes,
 * strings (rendered as text, never HTML), or falsy values (skipped) so
 * conditional children can be written inline as `condition && node`.
 */
export function el(tag, props = {}, children = []) {
  const node = document.createElement(tag);

  for (const [key, value] of Object.entries(props)) {
    if (value === undefined || value === null || value === false) continue;
    if (key === 'class') {
      node.className = value;
    } else if (key === 'dataset') {
      Object.assign(node.dataset, value);
    } else if (key.startsWith('on') && typeof value === 'function') {
      node.addEventListener(key.slice(2).toLowerCase(), value);
    } else if (value === true) {
      node.setAttribute(key, '');
    } else {
      node.setAttribute(key, value);
    }
  }

  appendChildren(node, children);
  return node;
}

export function appendChildren(node, children) {
  for (const child of [].concat(children)) {
    if (child === null || child === undefined || child === false) continue;
    node.append(child instanceof Node ? child : document.createTextNode(String(child)));
  }
  return node;
}

/** A Material Symbols glyph, matched to the icon names used by the Flutter app. */
export function icon(name, props = {}) {
  const { class: className = '', ...rest } = props;
  return el(
    'span',
    { class: `material-symbols-outlined ${className}`.trim(), 'aria-hidden': 'true', ...rest },
    name,
  );
}

export function clear(node) {
  node.replaceChildren();
  return node;
}

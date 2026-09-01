export class Project {
  constructor({ title, description, url, icon, tags = [], longDescription = null }) {
    this.title = title;
    this.description = description;
    this.url = url;
    this.icon = icon;
    this.tags = tags;
    this.longDescription = longDescription;
  }

  /** Full write-up shown in the project card; falls back to the short blurb. */
  get details() {
    return this.longDescription ?? this.description;
  }

  get domain() {
    try {
      return new URL(this.url).host;
    } catch {
      return this.url;
    }
  }
}

export const PROJECTS = [
  new Project({
    title: "Kay's ArtShow",
    description: 'A curated portfolio of original drawings, portraits, and illustrations.',
    longDescription:
      "Kay's ArtShow is a curated portfolio of original drawings, portraits, and illustrations, ranging from intimate pencil studies to bold concept photography. It features interactive filtering, sorting, multiple UI design themes, and high-resolution artwork viewing.",
    url: 'https://art.codedbykay.se/',
    icon: 'palette',
    tags: ['Art', 'Gallery', 'Illustration', 'JavaScript', 'HTML', 'CSS', 'Web'],
  }),
  new Project({
    title: 'Image Utility',
    description:
      'A browser-based utility for converting, compressing, resizing, and transforming images.',
    longDescription:
      'CodedByKay Image Utility is a fast, client-side image toolkit that lets you convert between formats, compress file sizes, resize dimensions, and apply basic transformations, all without uploading anything to a server. Built for developers and designers who need quick, no-fuss image processing right in the browser.',
    url: 'https://codedbykay-image-utility.netlify.app/',
    icon: 'image',
    tags: ['Image', 'Utility', 'Web', 'JavaScript', 'HTML', 'CSS', 'Convert', 'Compress'],
  }),
  new Project({
    title: 'Palette&MoodBoard',
    description: 'A browser-based tool for extracting color palettes and composing mood boards.',
    longDescription:
      'Palette&MoodBoard lets you drop in images and extract clean color swatches using k-means clustering, then sort by dominance, luminance, or hue and remap them into pastel, neon, muted, vivid, or dark themes. Harmony tools generate complementary, analogous, triadic, and tetradic schemes with one-click HEX/RGB copying. A separate mood board compositor batches multiple images into grid or dynamic layouts with adjustable spacing, margins, corner radius, aspect ratio, and sticky-note annotations, exporting the result as a high-resolution PNG.',
    url: 'https://palette.codedbykay.se/',
    icon: 'color_lens',
    tags: [
      'JavaScript',
      'HTML',
      'CSS',
      'Canvas',
      'Color Palette',
      'Mood Board',
      'Image Processing',
    ],
  }),
  new Project({
    title: 'NEO ICON',
    description: 'A tool for generating icons from text, or converting and resizing images.',
    longDescription:
      'A tool for generating icons from text and converting or resizing existing images. Once you have an icon, you can download a ZIP file containing the most common standard sizes. It is built with React, TypeScript, HTML, CSS, and Neo-Brutalism.',
    url: 'https://neo-icon.netlify.app/',
    icon: 'imagesearch_roller',
    tags: ['React', 'TypeScript', 'HTML', 'CSS', 'Neo-Brutalism', 'Icon', 'Design'],
  }),
  new Project({
    title: 'NEO Compare',
    description: 'A fast tool for comparing two pieces of text side by side.',
    longDescription:
      'Neo Compare is a lightweight text comparison tool designed for quick, in-browser diffing. You can paste two texts and see differences instantly, with options to trim whitespace, ignore case, skip blank lines, or even ignore line order. A reference mode lets you compare both sides against a single source, making it ideal for reviewing copy changes, code snippets, or content revisions without needing a full diff tool.',
    url: 'https://neo-compare.netlify.app/',
    icon: 'compare_arrows',
    tags: ['React', 'JavaScript', 'HTML', 'CSS', 'Text Compare', 'Diff Tool'],
  }),
  new Project({
    title: 'Dot Matrix Display',
    description:
      'A cyber-aesthetic HTML5 Canvas LED dot matrix display with custom text, animations, and glow effects.',
    longDescription:
      'Dot Matrix Display is an interactive LED terminal and animation generator built with HTML5 Canvas, JavaScript, and CSS. It features custom text scrolling, customizable grid sizes, dot shapes, glow effects, drawing tools, live camera feeds, and image dithering algorithms (Atkinson, Bayer, Floyd-Steinberg).',
    url: 'https://dot-matrix-display.netlify.app/',
    icon: 'grid_on',
    tags: [
      'JavaScript',
      'HTML',
      'CSS',
      'Canvas',
      'LED Matrix',
      'Animation',
      'Dithering',
      'Web',
    ],
  }),
  new Project({
    title: 'Terminal Emulator',
    description: 'A Gemini chat app with a customizable, vintage terminal aesthetic.',
    longDescription:
      'I created this project because I love the look and feel of vintage terminals, the glowing screen and the mechanical hum of the hardware. This Gemini chat application is my homage to those days, featuring various utility commands to customize and enhance the chat experience.',
    url: 'https://terminal.codedbykay.se/',
    icon: 'terminal',
    tags: [
      'React',
      'TypeScript',
      'HTML',
      'CSS',
      'Retro Aesthetics',
      'Gemini integration',
      'Chat',
    ],
  }),
  new Project({
    title: 'Simply Piano',
    description:
      'A 32-key browser piano built with Tone.js, featuring audio effects and song editing.',
    longDescription:
      'I developed this 32-key piano after falling in love with the incredible power and versatility of the Tone.js library. The application features a robust suite of audio effects and a fully integrated song editor, all meticulously crafted using vanilla JavaScript, HTML, and CSS.',
    url: 'https://simply-piano.netlify.app/',
    icon: 'piano',
    tags: ['Music', 'Web', 'Interactive', 'Tone.js', 'JavaScript', 'HTML', 'CSS'],
  }),
  new Project({
    title: 'Barvabygden',
    description: 'A community-driven web presence for the Barva parish in Sweden.',
    longDescription:
      'Barvabygden is a small but opinionated site for a Swedish parish, designed to be maintainable by non-developers while still feeling warm and human. The focus is on clarity of information architecture, events, news, and contact information are all a single click away, paired with typography and color choices that feel local and grounded rather than generic "template web." It was also an exercise in building something fast, accessible, and easy to host for a community with limited technical resources.',
    url: 'https://www.barvabygden.se/',
    icon: 'landscape',
    tags: ['Community', 'Web', 'Design', 'HTML', 'CSS', 'JavaScript'],
  }),
  new Project({
    title: 'Pixel Paint',
    description: 'A browser-based paint-by-pixel game. Bring your own image to paint.',
    longDescription:
      'Pixel Paint turns any image into a low-resolution grid you can "repaint" one tile at a time. The project explores canvas performance, color quantization, and UX for highly repetitive actions, things like keyboard shortcuts, smart color picking, and subtle hover states. It’s deliberately playful but sits on top of a carefully tuned rendering pipeline to keep interactions feeling crisp even for larger grids and user-supplied images.',
    url: 'https://pixel-paint-codedbykay.netlify.app/',
    icon: 'brush',
    tags: ['React', 'TypeScript', 'HTML', 'CSS', 'Art', 'Canvas', 'Creative', 'Pixel Paint'],
  })
];

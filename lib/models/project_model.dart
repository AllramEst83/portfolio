import 'package:flutter/material.dart';

class ProjectModel {
  final String title;
  final String description;
  final String url;
  final IconData icon;
  final List<String> tags;
  final String? longDescription;

  const ProjectModel({
    required this.title,
    required this.description,
    required this.url,
    required this.icon,
    required this.tags,
    this.longDescription,
  });

  static const List<ProjectModel> featured = [
    ProjectModel(
      title: 'Terminal Emulator',
      description:
          'This Gemini application honors vintage terminal aesthetics through a customizable chat interface.',
      url: 'https://terminal.codedbykay.se/',
      icon: Icons.terminal,
      tags: [
        'React',
        'TypeScript',
        'HTML',
        'CSS',
        'Retro Aesthetics',
        'Gemini integration',
        'Chat',
      ],
      longDescription:
          'I created this project because I love the look and feel of vintage terminals—the glowing screen and the mechanical hum of the hardware. This Gemini chat application is my homage to those days, featuring various utility commands to customize and enhance the chat experience.',
    ),
    ProjectModel(
      title: 'Simply Piano',
      description:
          'This 32-key piano leverages Tone.js for audio effects and song editing, engineered via vanilla JS, HTML, and CSS.',
      url: 'https://simply-piano.netlify.app/',
      icon: Icons.piano,
      tags: [
        'Music',
        'Web',
        'Interactive',
        'Tone.js',
        'JavaScript',
        'HTML',
        'CSS',
      ],
      longDescription:
          'I developed this 32-key piano after falling in love with the incredible power and versatility of the Tone.js library. The application features a robust suite of audio effects and a fully integrated song editor, all meticulously crafted using vanilla JavaScript, HTML, and CSS.',
    ),
    ProjectModel(
      title: 'Barvabygden',
      description:
          'A community-driven web presence for the Barva parish in Sweden.',
      url: 'https://www.barvabygden.se/',
      icon: Icons.landscape,
      tags: ['Community', 'Web', 'Design', 'HTML', 'CSS', 'JavaScript'],
      longDescription:
          'Barvabygden is a small but opinionated site for a Swedish parish, designed to be maintainable by non-developers while still feeling warm and human. The focus is on clarity of information architecture—events, news, and contact information are all a single click away—paired with typography and color choices that feel local and grounded rather than generic “template web.” It was also an exercise in building something fast, accessible, and easy to host for a community with limited technical resources.',
    ),
    ProjectModel(
      title: 'Pixel Paint',
      description:
          'A paint by pixel game in the browser. Bring your own image to paint.',
      url: 'https://pixel-paint-codedbykay.netlify.app/',
      icon: Icons.brush,
      tags: [
        'React',
        'TypeScript',
        'HTML',
        'CSS',
        'Art',
        'Canvas',
        'Creative',
        'Pixel Paint',
      ],
      longDescription:
          'Pixel Paint turns any image into a low-resolution grid you can “repaint” one tile at a time. The project explores canvas performance, color quantization, and UX for highly repetitive actions—things like keyboard shortcuts, smart color picking, and subtle hover states. It’s deliberately playful but sits on top of a carefully tuned rendering pipeline to keep interactions feeling crisp even for larger grids and user-supplied images.',
    ),
    ProjectModel(
      title: 'Lazy World',
      description:
          'Lazy World is productivity for the unmotivated: Kanban boards for getting things done… eventually. LazyDraw, doodle your dreams away. LazyNote, write it down before you forget. LazyAsk, AI that does the thinking for you. LazyBreathe, just breathe.',
      url: 'https://lazy-world.netlify.app/',
      icon: Icons.cloud,
      tags: [
        'Web',
        'Kanban',
        'AI',
        'TypeScript',
        'HTML',
        'CSS',
        'Chat',
        'Doodle',
        'Note',
        'Breathe',
        'React',
      ],
      longDescription:
          'Lazy World is a suite of tiny, tongue-in-cheek productivity tools built around the idea that not every system has to be hyper-optimized. Each mini-app—Kanban, doodling, notes, AI Q&A, breathing—shares a common design language but experiments with different interaction patterns, from drag-and-drop columns to sketch-like canvases. It’s a sandbox for testing how small, opinionated tools can make it easier to start rather than to “perfect” a workflow.',
    ),
    ProjectModel(
      title: 'NEO ICON',
      description: 'A tool for generating icons from text, converting and resizing existing images.',
      longDescription: 'A tool for generating icons from text and converting or resizing existing images. Once you have an icon, you can download a ZIP file containing the most common standard sizes. It is built with React, TypeScript, HTML, CSS, and Neo-Brutalism.',
      url: 'https://neo-icon.netlify.app/',
      icon: Icons.imagesearch_roller,
      tags: ['React', 'TypeScript', 'HTML', 'CSS', 'Neo-Brutalism', 'Icon', 'Design'],
    ),
    ProjectModel(
      title: 'Neo Compare',
      description:
          'A fast, browser-based tool for comparing two pieces of text side by side.',
      longDescription:
          'Neo Compare is a lightweight text comparison tool designed for quick, in-browser diffing. You can paste two texts and see differences instantly, with options to trim whitespace, ignore case, skip blank lines, or even ignore line order. A reference mode lets you compare both sides against a single source, making it ideal for reviewing copy changes, code snippets, or content revisions without needing a full diff tool.',
      url: 'https://neo-compare.netlify.app/',
      icon: Icons.compare_arrows,
      tags: [
        'React',
        'JavaScript',
        'HTML',
        'CSS',
        'Text Compare',
        'Diff Tool',
      ],
    ),
  ];

  String get slug {
    final normalized = title
        .toLowerCase()
        .replaceAll(RegExp(r'[^a-z0-9\s-]'), '')
        .trim()
        .replaceAll(RegExp(r'\s+'), '-');
    return normalized;
  }

  static ProjectModel? fromSlug(String slug) {
    try {
      return featured.firstWhere((project) => project.slug == slug);
    } catch (_) {
      return null;
    }
  }
}

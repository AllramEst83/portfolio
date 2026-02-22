import 'package:flutter/material.dart';

class ProjectModel {
  final String title;
  final String description;
  final String url;
  final IconData icon;
  final List<String> tags;

  const ProjectModel({
    required this.title,
    required this.description,
    required this.url,
    required this.icon,
    required this.tags,
  });

  static const List<ProjectModel> featured = [
    ProjectModel(
      title: 'Terminal Emulator',
      description:
          'This project reimagines a late-20th-century terminal—glowing phosphor text, chunky borders, and all—but layers it with a modern conversational AI experience. The goal was to capture that nostalgic boot-screen vibe while letting today’s LLM-backed workflows shine, giving developers a playground where retro aesthetics meet contemporary intelligence.',
      url: 'https://terminal.codedbykay.se/',
      icon: Icons.terminal,
      tags: [
        'Web',
        'CLI emulator',
        'Interactive',
        'LLM',
        'TypeScript',
        'HTML',
        'CSS',
      ],
    ),
    ProjectModel(
      title: 'Simply Piano',
      description:
          'A modern, interactive 32-key piano web application built with Tone.js for real-time sound synthesis, extensive audio effects, and built-in song playback capabilities.',
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
    ),
    ProjectModel(
      title: 'Barvabygden',
      description:
          'A community-driven web presence for the Barva parish in Sweden.',
      url: 'https://barvabygden.netlify.app/',
      icon: Icons.landscape,
      tags: ['Community', 'Web', 'Design', 'HTML', 'CSS', 'JavaScript'],
    ),
    ProjectModel(
      title: 'Pixel Paint',
      description:
          'A paint by pixel game in the browser. Bring your own image to paint.',
      url: 'https://pixel-paint-codedbykay.netlify.app/',
      icon: Icons.brush,
      tags: ['Art', 'Canvas', 'Creative', 'TypeScript', 'HTML', 'CSS'],
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
    ),
  ];
}

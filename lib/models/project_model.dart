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
          'A web-based terminal emulator — command-line vibes in the browser.',
      url: 'https://terminal.codedbykay.se/',
      icon: Icons.terminal,
      tags: ['Web', 'CLI', 'Interactive'],
    ),
    ProjectModel(
      title: 'Simply Piano',
      description:
          'An interactive piano built for the web — press keys, make music.',
      url: 'https://simply-piano.netlify.app/',
      icon: Icons.piano,
      tags: ['Music', 'Web', 'Interactive'],
    ),
    ProjectModel(
      title: 'Barvabygden',
      description:
          'A community-driven web presence for the Barva village region.',
      url: 'https://barvabygden.netlify.app/',
      icon: Icons.landscape,
      tags: ['Community', 'Web', 'Design'],
    ),
    ProjectModel(
      title: 'Pixel Paint',
      description:
          'A pixel art editor in the browser — draw, color, create.',
      url: 'https://pixel-paint-codedbykay.netlify.app/',
      icon: Icons.brush,
      tags: ['Art', 'Canvas', 'Creative'],
    ),
  ];
}

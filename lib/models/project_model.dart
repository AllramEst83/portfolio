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
          'A retro-inspired terminal playground that fuses nostalgic phosphor aesthetics with modern LLM intelligence.',
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
      longDescription:
          'This project reimagines the old-school terminal, complete with glowing phosphor text and chunky borders, and layers it with a modern conversational AI experience. The goal was to capture a nostalgic boot-screen vibe while letting today’s LLM-backed workflows shine, giving developers a playground where retro aesthetics meet contemporary intelligence.',
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
      longDescription:
          'Simply Piano started as a study in timing, latency, and ergonomics for music creation in the browser. The 32-key layout, built on top of Tone.js, focuses on immediacy: low-latency feedback, clear visual states for pressed keys, and simple controls for switching instruments and effects. Under the hood it coordinates real-time synthesis with scheduling and playback so that even casual users can improvise, replay, and layer sounds without getting lost in a DAW-style interface.',
    ),
    ProjectModel(
      title: 'Barvabygden',
      description:
          'A community-driven web presence for the Barva parish in Sweden.',
      url: 'https://barvabygden.netlify.app/',
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
      tags: ['Art', 'Canvas', 'Creative', 'TypeScript', 'HTML', 'CSS'],
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

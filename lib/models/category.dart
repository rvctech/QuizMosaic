import 'package:flutter/material.dart';

class Category {
  final String id;
  final String name;
  final IconData icon;
  final Color color;

  const Category({
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
  });

  static const List<Category> all = [
    Category(
      id: 'science',
      name: 'Science',
      icon: Icons.science,
      color: Color(0xFF4CAF50),
    ),
    Category(
      id: 'history',
      name: 'History',
      icon: Icons.history,
      color: Color(0xFFFF9800),
    ),
    Category(
      id: 'geography',
      name: 'Geography',
      icon: Icons.public,
      color: Color(0xFF2196F3),
    ),
    Category(
      id: 'sports',
      name: 'Sports',
      icon: Icons.sports_soccer,
      color: Color(0xFFF44336),
    ),
    Category(
      id: 'entertainment',
      name: 'Entertainment',
      icon: Icons.movie,
      color: Color(0xFF9C27B0),
    ),
    Category(
      id: 'technology',
      name: 'Technology',
      icon: Icons.computer,
      color: Color(0xFF00BCD4),
    ),
    Category(
      id: 'literature',
      name: 'Literature',
      icon: Icons.menu_book,
      color: Color(0xFF795548),
    ),
    Category(
      id: 'random',
      name: 'Random Mix',
      icon: Icons.shuffle,
      color: Color(0xFF607D8B),
    ),
  ];
}

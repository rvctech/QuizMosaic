import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  final double size;

  const AppLogo({super.key, this.size = 32});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/Logo.jpg',
          width: size * 0.8,
          height: size * 0.8,
          errorBuilder: (context, error, stackTrace) =>
              Icon(Icons.quiz, size: size * 0.7, color: Theme.of(context).colorScheme.primary),
        ),
        const SizedBox(width: 6),
        Text(
          'QuizMosaic',
          style: TextStyle(
            fontSize: size,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
            letterSpacing: -0.5,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

// Widget for displaying a star rating level
class StartLevel extends StatelessWidget {
  final int stars;

  const StartLevel({super.key, required this.stars});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        if (index < stars) {
          return  Icon(Icons.star, color: theme.disabledColor);
        } else {
          return  Icon(Icons.star_border, color: theme.focusColor);
        }
      }),
    );
  }
}
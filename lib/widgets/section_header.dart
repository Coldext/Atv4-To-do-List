import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final int count;
  final Color color;

  const SectionHeader({
    super.key,
    required this.title,
    required this.count,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '$title ($count)',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }
}
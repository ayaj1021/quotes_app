import 'package:flutter/material.dart';

class QuotesCard extends StatelessWidget {
  const QuotesCard({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white.withOpacity(0.25),
      elevation: 10,
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

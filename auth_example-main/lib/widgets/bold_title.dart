import 'package:flutter/material.dart';

class BoldTitle extends StatelessWidget {
  final String text;
  const BoldTitle({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

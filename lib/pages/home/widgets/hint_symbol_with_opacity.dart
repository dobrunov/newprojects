import 'package:flutter/material.dart';

import '../../../styles/styles.dart';

class HintSymbolWithOpacity extends StatelessWidget {
  final double opacity;
  final String text;

  const HintSymbolWithOpacity({
    super.key,
    required this.opacity,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: Text(
        text,
        style: const TextStyle(color: hintTextColor, fontSize: 16),
      ),
    );
  }
}

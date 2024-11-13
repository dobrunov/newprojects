import 'package:flutter/material.dart';

import '../../../styles/styles.dart';

class HintSymbolsWithOpacity extends StatelessWidget {
  final double opacity;
  final String text;

  const HintSymbolsWithOpacity({
    Key? key,
    required this.opacity,
    required this.text,
  }) : super(key: key);

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

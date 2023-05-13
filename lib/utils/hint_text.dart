import 'package:flutter/material.dart';

import '../styles/styles.dart';

class HintSymbolsWithOpacity extends StatelessWidget {
  final double opacity;
  final String text;

  const HintSymbolsWithOpacity(this.opacity, this.text, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: Text(
        text,
        style: hintTextStyle,
      ),
    );
  }
}



import 'package:flutter/material.dart';

import '../../styles/styles.dart';

class CountryButtonContent extends StatelessWidget {
  const CountryButtonContent({
    super.key,
    required String initFlag,
    required String initCode,
  })  : _initFlag = initFlag,
        _initCode = initCode;

  final String _initFlag;
  final String _initCode;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(4.0),
          child: Image.network(_initFlag, width: 24.0, height: 20.0, fit: BoxFit.fill),
        ),
        const SizedBox(width: 6),
        Text(
          _initCode,
          style: phoneNumberText,
        ),
      ],
    );
  }
}

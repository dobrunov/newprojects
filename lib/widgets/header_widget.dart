import 'package:flutter/material.dart';

import '../styles/styles.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: const [
        Padding(
          padding: paddingLeftTopRight155015,
          child: Text(
            'Get Started',
            style: header1,
          ),
        ),
      ],
    );
  }
}
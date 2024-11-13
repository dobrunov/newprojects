import 'package:flutter/material.dart';

import '../../../styles/styles.dart';
import 'country_selector.dart';

class FlagCodeWidget extends StatelessWidget {
  const FlagCodeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: 110,
      padding: paddingLeftRight5,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: lightField,
        borderRadius: BorderRadius.circular(16),
      ),
      child:
          //
          const CountrySelector(),
    );
  }
}

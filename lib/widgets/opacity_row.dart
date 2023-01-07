import 'package:flutter/material.dart';

import '../hint_text/hint_text.dart';

class OpacityRow extends StatelessWidget {
  const OpacityRow({
    Key? key,
    required this.opacityList,
  }) : super(key: key);

  final List<double> opacityList;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: true,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          HintSymbolsWithOpacity(opacityList[0], '('),
          HintSymbolsWithOpacity(opacityList[1], '1'),
          HintSymbolsWithOpacity(opacityList[2], '2'),
          HintSymbolsWithOpacity(opacityList[3], '3'),
          HintSymbolsWithOpacity(opacityList[4], ')'),
          HintSymbolsWithOpacity(opacityList[5], ' '),
          HintSymbolsWithOpacity(opacityList[6], '1'),
          HintSymbolsWithOpacity(opacityList[7], '2'),
          HintSymbolsWithOpacity(opacityList[8], '3'),
          HintSymbolsWithOpacity(opacityList[9], '-'),
          HintSymbolsWithOpacity(opacityList[10], '1'),
          HintSymbolsWithOpacity(opacityList[11], '2'),
          HintSymbolsWithOpacity(opacityList[12], '3'),
          HintSymbolsWithOpacity(opacityList[13], '4'),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../utils/hint_text.dart';

class OpacityRow extends StatelessWidget {
  const OpacityRow({
    Key? key,
    required this.opacityList,
  }) : super(key: key);

  final List<double> opacityList;

  @override
  Widget build(BuildContext context) {
    //
    List<String> maskList = ['(', '1', '2', '3', ')', ' ', '1', '2', '3', '-', '1', '2', '3', '4'];
    //
    return IgnorePointer(
      ignoring: true,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 14,
              itemBuilder: (BuildContext context, int index) {
                return HintSymbolsWithOpacity(opacityList[index], maskList[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

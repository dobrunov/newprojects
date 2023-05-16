import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/mask_controller.dart';
import '../controller/opacity_controller.dart';
import 'hint_text.dart';

class OpacityRow extends StatefulWidget {
  const OpacityRow({
    Key? key,
  }) : super(key: key);

  @override
  State<OpacityRow> createState() => _OpacityRowState();
}

class _OpacityRowState extends State<OpacityRow> {
  late List<double> opacityList;
  late List<String> maskList;

  @override
  void didChangeDependencies() {
    opacityList = context.watch<HintOpacityController>().getOpacity;
    maskList = context.watch<MaskController>().getMaskList;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: true,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: maskList.length * 10,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: maskList.length,
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

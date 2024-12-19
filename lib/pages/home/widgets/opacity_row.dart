import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controllers/hint_opacity_controller.dart';
import '../../../controllers/mask_controller.dart';
import 'hint_symbol_with_opacity.dart';

class OpacityRow extends StatefulWidget {
  const OpacityRow({super.key});

  @override
  State<OpacityRow> createState() => _OpacityRowState();
}

class _OpacityRowState extends State<OpacityRow> {
  late List<double> opacityList;
  late List<String> maskList;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    opacityList = context.watch<HintOpacityController>().getOpacity;
    maskList = context.watch<MaskController>().getMaskList;
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: true,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: maskList.length * 10.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: maskList.length,
              itemBuilder: (BuildContext context, int index) {
                return HintSymbolWithOpacity(
                  opacity: opacityList.isNotEmpty ? opacityList[index] : 1.0,
                  text: maskList.isNotEmpty ? maskList[index] : '',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

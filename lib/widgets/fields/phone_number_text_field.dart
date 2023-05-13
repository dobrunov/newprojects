import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

import '../../controller/opacity_controller.dart';
import '../../styles/styles.dart';
import '../opacity_row.dart';

class PhoneNumberTextField extends StatelessWidget {
  const PhoneNumberTextField({
    Key? key,
    required this.controller,
    required this.maskFormatter,
    required this.opacityList,
  }) : super(key: key);

  final TextEditingController controller;
  final MaskTextInputFormatter maskFormatter;
  final List<double> opacityList;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Stack(children: [
        TextFormField(
          controller: controller,
          style: phoneNumberText,
          autofocus: true,
          cursorColor: textColor,
          cursorWidth: 2,
          cursorHeight: 20,
          keyboardType: TextInputType.phone,
          inputFormatters: [
            maskFormatter,
            FilteringTextInputFormatter(RegExp(r'^[()\d -]{1,14}$'), allow: true),
          ],
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: const InputDecoration(
            border: InputBorder.none,
            isCollapsed: true,
            floatingLabelBehavior: FloatingLabelBehavior.never,
          ),
          onChanged: (newOpacity) => context.read<HintOpacityController>().changeString(newOpacity),
        ),
        Padding(
          padding: EdgeInsets.zero,
          child: OpacityRow(opacityList: opacityList),
        ),
      ]),
    );
  }
}

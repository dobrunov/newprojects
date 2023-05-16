import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../styles/styles.dart';
import 'fields/phone_number_text_field.dart';

class PhoneNumberWidget extends StatelessWidget {
  const PhoneNumberWidget({
    super.key,
    required this.controller,
    required this.maskFormatter,
  });

  final TextEditingController controller;
  final MaskTextInputFormatter maskFormatter;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 48,
        margin: marginLeft10,
        padding: paddingAll10,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: lightField,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: PhoneNumberTextField(
            controller: controller,
            maskFormatter: maskFormatter,
          ),
        ),
      ),
    );
  }
}

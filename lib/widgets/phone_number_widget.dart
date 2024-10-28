import 'package:flutter/material.dart';

import '../styles/styles.dart';
import 'fields/phone_number_text_field.dart';

class PhoneNumberWidget extends StatelessWidget {
  const PhoneNumberWidget({super.key});

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
        child: const Padding(
          padding: EdgeInsets.only(top: 4.0),
          child: PhoneNumberTextField(),
        ),
      ),
    );
  }
}

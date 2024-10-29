import 'package:flutter/material.dart';

import 'fields/phone_number_text_field.dart';

class PhoneNumberWidget extends StatelessWidget {
  const PhoneNumberWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 48,
        margin: const EdgeInsets.only(left: 10),
        padding: const EdgeInsets.all(10),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: const Color(0x66F4F5FF),
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

import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../widgets/header_widget.dart';
import '../widgets/buttons/next_button.dart';
import '../styles/styles.dart';
import '../widgets/flag_code_widget.dart';
import '../widgets/phone_number_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var maskFormatter = MaskTextInputFormatter(
      mask: '(###) ###-####', filter: {"#": RegExp(r'[0-9]')}, type: MaskAutoCompletionType.lazy);

  late TextEditingController controller;

  bool isButtonActive = true;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    controller.addListener(() {
      final isButtonActive = controller.text.length == 14;
      setState(() {
        this.isButtonActive = isButtonActive;
      });
    });
    //
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //
    return Column(
      children: [
        const HeaderWidget(),
        sizedBoxHeigh100,

        // CODE & PHONE INPUT
        Padding(
          padding: paddingLeftRight15,
          child: Row(
            children: [
              // Button which call bottom sheet with countries list
              const FlagCodeWidget(),
              // Phone number text field with smart hint
              PhoneNumberWidget(
                controller: controller,
                maskFormatter: maskFormatter,
              ),
            ],
          ),
        ),
        sizedBoxHeight124,
        //
        NextButton(
          isButtonActive: isButtonActive,
          controller: controller,
        ),
      ],
    );
  }
}

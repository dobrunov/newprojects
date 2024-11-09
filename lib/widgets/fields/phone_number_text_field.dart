import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

import '../../controllers/button_active_controller.dart';
import '../../controllers/opacity_controller.dart';
import '../../controllers/text_controller.dart';
import '../../styles/styles.dart';
import '../opacity_row.dart';

class PhoneNumberTextField extends StatefulWidget {
  const PhoneNumberTextField({Key? key}) : super(key: key);

  @override
  State<PhoneNumberTextField> createState() => _PhoneNumberTextFieldState();
}

class _PhoneNumberTextFieldState extends State<PhoneNumberTextField> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = context.read<TextControllers>().phoneNumberTextController;
    controller.addListener(() {
      context.read<ButtonActiveController>().changeButtonActive(controller.text.length == 14);
    });
  }

  final maskFormatter = MaskTextInputFormatter(
    mask: '(###) ###-####',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  @override
  void dispose() {
    controller.removeListener(() {
      context.read<ButtonActiveController>().changeButtonActive(controller.text.length == 14);
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Stack(
        children: [
          TextFormField(
            controller: controller,
            style: phoneNumberText,
            autofocus: true,
            cursorColor: textColor,
            cursorWidth: 1.5,
            cursorHeight: 25.0,
            keyboardType: TextInputType.phone,
            inputFormatters: [maskFormatter],
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(
              border: InputBorder.none,
              isCollapsed: true,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              contentPadding: EdgeInsets.symmetric(vertical: 3),
            ),
            onChanged: (newOpacity) => context.read<HintOpacityController>().changeString(newOpacity),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 6),
            child: Align(
              alignment: Alignment.centerLeft,
              child: OpacityRow(),
            ),
          ),
        ],
      ),
    );
  }
}

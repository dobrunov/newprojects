import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

import '../../controllers/button_active_controller.dart';
import '../../controllers/opacity_controller.dart';
import '../../controllers/text_controller.dart';
import '../../styles/styles.dart';
import '../opacity_row.dart';

class PhoneNumberTextField extends StatefulWidget {
  const PhoneNumberTextField({
    Key? key,
  }) : super(key: key);

  @override
  State<PhoneNumberTextField> createState() => _PhoneNumberTextFieldState();
}

class _PhoneNumberTextFieldState extends State<PhoneNumberTextField> {
  late final TextEditingController controller;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    controller = Provider.of<TextControllers>(context, listen: false).phoneNumberTextController;
    if (!controller.hasListeners) {
      controller.addListener(() {
        context.read<ButtonActiveController>().changeButtonActive(controller.text.length == 14);
      });
    }
  }

  final maskFormatter = MaskTextInputFormatter(
    mask: '(###) ###-####',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

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
            // FilteringTextInputFormatter(RegExp(r'^[()\d -]{1,14}$'), allow: true),
          ],
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: const InputDecoration(
            border: InputBorder.none,
            isCollapsed: true,
            floatingLabelBehavior: FloatingLabelBehavior.never,
          ),
          onChanged: (newOpacity) => context.read<HintOpacityController>().changeString(newOpacity),
        ),
        const Padding(
          padding: EdgeInsets.zero,
          child: OpacityRow(),
        ),
      ]),
    );
  }
}

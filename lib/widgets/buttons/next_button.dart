import 'package:flutter/material.dart';
import 'package:phone_number_input_fromscratch/pages/second_page.dart';
import 'package:provider/provider.dart';

import '../../controller/opacity_controller.dart';
import '../../utils/hint_text.dart';
import '../../styles/styles.dart';

class NextButton extends StatelessWidget {
  const NextButton({
    Key? key,
    required this.isButtonActive,
    required this.controller,
  }) : super(key: key);

  final bool isButtonActive;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: paddingRight15,
          child: SizedBox(
            height: 48,
            width: 48,
            child: ElevatedButton(
              style: ButtonStyle(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                backgroundColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
                  if (states.contains(MaterialState.disabled)) {
                    return buttonDisabledColor;
                  }
                  return buttonEnabledColor;
                }),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
              ),
              onPressed: isButtonActive
                  ? () {
                      print('Your number win 100 euro');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SecondPage(),
                        ),
                      );

                      Future.delayed(const Duration(seconds: 1), () {
                        controller.clear();
                        // print('delayed execution');
                        Provider.of<HintOpacityController>(context, listen: false).changeString('');
                      });
                    }
                  : null,
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.zero,
                  child: Center(
                    child: Icon(
                      Icons.arrow_forward,
                      color: buttonIconColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

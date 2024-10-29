import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/opacity_controller.dart';
import '../../controllers/text_controller.dart';
import '../../controllers/button_active_controller.dart';
import '../../pages/second_page.dart';

class NextButton extends StatelessWidget {
  const NextButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textControllers = Provider.of<TextControllers>(context);

    return Consumer<ButtonActiveController>(
      builder: (context, buttonActiveController, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: SizedBox(
                height: 48,
                width: 48,
                child: ElevatedButton(
                  style: ButtonStyle(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    backgroundColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
                      if (states.contains(MaterialState.disabled)) {
                        return const Color(0x66F4F5FF);
                      }
                      return const Color(0xFFFFFFFF);
                    }),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    )),
                  ),
                  onPressed: buttonActiveController.isButtonActive
                      ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const SecondPage()),
                          );

                          Future.delayed(const Duration(seconds: 1), () {
                            textControllers.clearPhoneNumberText();
                            Provider.of<HintOpacityController>(context, listen: false).changeString('');
                          });
                        }
                      : null,
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.zero,
                      child: Icon(
                        Icons.arrow_forward,
                        color: Color(0xFF7886B8),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

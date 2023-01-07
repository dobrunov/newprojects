import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:phone_number_input_fromscratch/styles/styles.dart';
import 'package:phone_number_input_fromscratch/widgets/opacity_row.dart';
import 'package:phone_number_input_fromscratch/widgets/second_screen.dart';
import 'package:provider/provider.dart';
import 'country_selector.dart';
import 'hint_text/hint_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var maskFormatter = MaskTextInputFormatter(
      mask: '(###) ###-####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

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
    var opacityList = context.watch<HintOpacityController>().getOpacity;

    ///
    return Column(
      children: [
        /// HEADER
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Padding(
              padding: paddingLeftTopRight155015,
              child: Text(
                'Get Started',
                style: header1,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 100,
        ),

        /// CODE & PHONE INPUT
        Padding(
          padding: paddingLeftRight15,
          child: Row(
            children: [
              /// Flag-code
              Container(
                height: 48,
                width: 110,
                padding: paddingLeftRight5,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: lightField,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const CountrySelector(),
              ),

              /// Phone number
              Expanded(
                child: Container(
                  height: 48,
                  margin: marginLeft10,
                  padding: paddingAll10,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: lightField,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Form(
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
                          FilteringTextInputFormatter(
                              RegExp(r'^[()\d -]{1,14}$'),
                              allow: true),
                        ],
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          isCollapsed: true,
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                        ),
                        onChanged: (newOpacity) => context
                            .read<HintOpacityController>()
                            .changeString(newOpacity),
                      ),
                      Padding(
                        padding: EdgeInsets.zero,
                        child: OpacityRow(opacityList: opacityList),
                      ),
                    ]),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 124,
        ),

        /// BUTTON
        Row(
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
                    backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
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
                              builder: (context) => const SecondScreen(),
                            ),
                          );

                          Future.delayed(const Duration(seconds: 1), () {
                            controller.clear();
                            // print('delayed execution');
                            Provider.of<HintOpacityController>(context,
                                    listen: false)
                                .changeString('');
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
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../../widgets/buttons/next_button.dart';
import 'widgets/flag_code_widget.dart';
import 'widgets/header_widget.dart';
import 'widgets/phone_number_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    final h = MediaQuery.sizeOf(context).height;
    //
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: h * 0.2),
            child: const HeaderWidget(),
          ),
          SizedBox(
            width: w,
            child: Padding(
              padding: EdgeInsets.only(left: w * 0.05, right: w * 0.05),
              child: const Row(
                children: [
                  FlagCodeWidget(),
                  PhoneNumberWidget(),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: h * 0.2),
            child: const NextButton(),
          ),
        ],
      ),
    );
  }
}

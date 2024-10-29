import 'package:flutter/material.dart';

import '../widgets/header_widget.dart';
import '../widgets/buttons/next_button.dart';
import '../widgets/flag_code_widget.dart';
import '../widgets/phone_number_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 100.0),
            child: HeaderWidget(),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: const Padding(
              padding: EdgeInsets.only(left: 15.0, right: 15.0),
              child: Row(
                children: [
                  FlagCodeWidget(),
                  PhoneNumberWidget(),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 100.0),
            child: NextButton(),
          ),
        ],
      ),
    );
  }
}

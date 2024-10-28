import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          HeaderWidget(),
          sizedBoxHeigh100,
          CodeAndPhoneInput(),
          sizedBoxHeight124,
          NextButton(),
        ],
      ),
    );
  }
}

class CodeAndPhoneInput extends StatelessWidget {
  const CodeAndPhoneInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: paddingLeftRight15,
      child: Row(
        children: [
          FlagCodeWidget(),
          PhoneNumberWidget(),
        ],
      ),
    );
  }
}

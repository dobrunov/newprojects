import 'package:flutter/material.dart';

class TextControllers extends ChangeNotifier {
  final TextEditingController phoneNumberTextController = TextEditingController();
  final TextEditingController searchFieldTextController = TextEditingController();

  void clearPhoneNumberText() {
    phoneNumberTextController.clear();
    notifyListeners();
  }

  void clearSearchFieldText() {
    searchFieldTextController.clear();
    notifyListeners();
  }

  @override
  void dispose() {
    phoneNumberTextController.dispose();
    searchFieldTextController.dispose();

    super.dispose();
  }
}

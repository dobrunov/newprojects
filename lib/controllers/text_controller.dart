import 'package:flutter/material.dart';

class TextController extends ChangeNotifier {
  final TextEditingController controller = TextEditingController();

  void clearText() {
    controller.clear();
    notifyListeners();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

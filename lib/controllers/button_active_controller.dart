import 'package:flutter/cupertino.dart';

class ButtonActiveController with ChangeNotifier {
  late bool _isButtonActive = false;

  bool get isButtonActive => _isButtonActive;

  void changeButtonActive(bool active) {
    _isButtonActive = active;
    notifyListeners();
  }
}

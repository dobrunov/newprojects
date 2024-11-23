import 'package:flutter/material.dart';

import 'mask_controller.dart';

class HintOpacityController with ChangeNotifier {
  MaskController maskController = MaskController();
  List<double> _showHintOpacity = [];
  List<double> _currentHintOpacity = [];

  List<double> get getOpacity => _showHintOpacity;

  HintOpacityController() {
    _showHintOpacity = List.generate(maskController.getMaskList.length, (int index) => 1.0, growable: false);
    _currentHintOpacity = List.generate(maskController.getMaskList.length, (int index) => 1.0, growable: false);
  }

  void changeString(String text) {
    // Amount of entered symbols in text field
    int newStringLength = text.length;

    for (var i = 0; i <= newStringLength - 1; i++) {
      _currentHintOpacity[i] = 0;
    }
    for (var y = newStringLength; y <= _currentHintOpacity.length - 1; y++) {
      _currentHintOpacity[y] = 1;
    }

    _showHintOpacity = _currentHintOpacity;
    notifyListeners();
  }
}

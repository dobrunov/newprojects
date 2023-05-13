import 'package:flutter/material.dart';

class HintOpacityController with ChangeNotifier {
  ///

  List<double> _showHintOpacity = [1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0];
  List<double> currentHintOpacity = [1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0];

  List<double> get getOpacity => _showHintOpacity;

  void changeString(String newString) {
    ///
    /// Amount of entered symbols in text field
    int newStringLength = newString.length;

    ///
    for (var i = 0; i <= newStringLength - 1; i++) {
      currentHintOpacity[i] = 0;
    }
    for (var y = newStringLength; y <= currentHintOpacity.length - 1; y++) {
      currentHintOpacity[y] = 1;
    }

    ///
    _showHintOpacity = currentHintOpacity;
    notifyListeners();
  }
}

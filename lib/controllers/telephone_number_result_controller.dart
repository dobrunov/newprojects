import 'package:flutter/cupertino.dart';

class TelephoneNumberResultController with ChangeNotifier {
  late String _telephoneNumberResult = "";

  String get telephoneNumberResult => _telephoneNumberResult;

  void changeTelephoneNumberResult(String code, String number) {
    _telephoneNumberResult = code + number;
    notifyListeners();
  }
}

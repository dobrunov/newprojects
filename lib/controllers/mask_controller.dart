import 'package:flutter/cupertino.dart';

import '../config.dart';

class MaskController {
  String maskText = Config.maskText;
  List<String> _maskList = [];

  MaskController() {
    _maskList = maskText.split('');
    debugPrint(_maskList.toString());
  }

  List<String> get getMaskList => _maskList;
}

class MaskController {
  String maskText = "(123) 123-1134";
  List<String> _maskList = [];

  MaskController() {
    _maskList = maskText.split('');
    print(_maskList);
  }

  List<String> get getMaskList => _maskList;
}

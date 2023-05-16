class MaskController {
  String maskText = "(123) 123-1234";
  List<String> _maskList = [];

  MaskController() {
    _maskList = maskText.split('');
    print(_maskList);
  }

  List<String> get getMaskList => _maskList;
}

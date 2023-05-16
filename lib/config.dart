class Config {
  final String _initFlag = 'https://flagcdn.com/w320/ua.png';
  final String _initCode = '+380';

  Config([initFlag, initCode]);

  String get initFlag => _initFlag;
  String get initCode => _initCode;
}

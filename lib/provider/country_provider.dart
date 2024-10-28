import 'package:flutter/material.dart';
import '../config.dart';
import '../models/country.dart';
import '../services/country_service.dart';

class CountryProvider extends ChangeNotifier {
  final _service = CountryService();

  bool isLoading = false;
  List<Country> _countries = [];
  List<Country> _filterCountries = [];
  List<Country> get countries => _countries;

  String _searchString = "";

  String _selectedFlag;
  String _selectedCode;

  String get selectedFlag => _selectedFlag;
  String get selectedCode => _selectedCode;

  CountryProvider()
      : _selectedFlag = Config.initFlag,
        _selectedCode = Config.initCode;

  Future<void> getAllCountries() async {
    isLoading = true;
    notifyListeners();

    final response = await _service.getAll();

    _countries = _filterCountries = response;

    isLoading = false;
    notifyListeners();
  }

  List<Country> get bestCountries {
    List<Country> results = [];

    if (_searchString.isEmpty) {
      results = _filterCountries;
    } else {
      results = _filterCountries.where((c) {
        final countryLower = c.name.toLowerCase();
        final code = c.callingCodes.first;
        final searchLower = _searchString.toLowerCase();

        return countryLower.contains(searchLower) || code.contains(searchLower);
      }).toList();
    }

    return results;
  }

  void changeSearchString(String searchString) {
    _searchString = searchString;
    notifyListeners();
  }

  void selectCountry({required String flagUrl, required String code}) {
    _selectedFlag = flagUrl;
    _selectedCode = code;
    notifyListeners();
  }
}

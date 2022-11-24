import 'package:flutter/material.dart';

import '../models/country.dart';
import '../services/country_service.dart';

class CountryProvider extends ChangeNotifier {
  // create instance of api service
  final _service = CountryService();
  //
  bool isLoading = false;
  List<Country> _countries = [];
  List<Country> _filterCountries = [];
  List<Country> get countries => _countries;
  String _searchString = "";

  // get data
  Future<void> getAllCountries() async {
    isLoading = true;
    notifyListeners();

    final response = await _service.getAll();

    _countries = _filterCountries = response;

    isLoading = false;
    notifyListeners();
  }

  ///
  List<Country> get bestCountries {
    List<Country> results = [];

    if (_searchString.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _filterCountries;
      //
    } else {
      results = _filterCountries.where((c) {
        final countryLower = c.name.toLowerCase();
        final code = c.callingCodes.first;
        final searchLower = _searchString.toLowerCase();
        //
        // display list of countries in which entered number or keyword present
        return countryLower.contains(searchLower) || code.contains(searchLower);
      }).toList();
    }

    return results;
  }

  // function when type text in search field
  void changeSearchString(String searchString) {
    _searchString = searchString;

    print(_searchString);
    notifyListeners();
  }
}

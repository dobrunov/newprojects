import 'package:http/http.dart' as http;

import '../models/country.dart';

class CountryService {
  Future<List<Country>> getAll() async {
    ///
    const url = 'https://restcountries.com/v2/all';
    final uri = Uri.parse(url);

    ///
    final response = await http.get(uri);

    ///
    if (response.statusCode == 200) {
      var json = response.body;
      return countryFromJson(json);
    }
    throw Exception("Error");
  }
}

import 'dart:convert';

import 'package:http/http.dart' as http;

import '../config.dart';
import '../models/country.dart';

class CountryService {
  final String _baseUrl = Config.baseUrl;

  Future<List<Country>> getCountryList() async {
    final uri = Uri.parse(_baseUrl);

    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        return _parseCountries(response.body);
      } else {
        throw Exception("Failed to load countries, Status code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Failed to fetch countries: $e");
    }
  }

  List<Country> _parseCountries(String responseBody) {
    final parsed = json.decode(responseBody) as List<dynamic>;
    return parsed.map((json) => Country.fromJson(json)).toList();
  }
}

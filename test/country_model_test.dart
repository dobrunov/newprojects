import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:phone_number_input_fromscratch/models/country.dart';

void main() {
  const String countryJson = '''
  {
    "name": "United States",
    "callingCodes": ["1"],
    "flags": {
      "svg": "https://flagcdn.com/us.svg",
      "png": "https://flagcdn.com/w320/us.png"
    }
  }
  ''';

  group('Country', () {
    test('fromJson creates a valid Country object', () {
      final Map<String, dynamic> jsonMap = json.decode(countryJson);
      final Country country = Country.fromJson(jsonMap);

      expect(country.name, 'United States');
      expect(country.callingCodes, ['1']);
      expect(country.flags.svg, 'https://flagcdn.com/us.svg');
      expect(country.flags.png, 'https://flagcdn.com/w320/us.png');
    });

    test('countryFromJson creates a list of Country objects', () {
      final List<Country> countries = countryFromJson('[$countryJson]');

      expect(countries.length, 1);

      final Country country = countries.first;
      expect(country.name, 'United States');
      expect(country.callingCodes, ['1']);
      expect(country.flags.svg, 'https://flagcdn.com/us.svg');
      expect(country.flags.png, 'https://flagcdn.com/w320/us.png');
    });
  });

  group('Flags', () {
    test('fromJson creates a valid Flags object', () {
      final Map<String, dynamic> jsonMap = json.decode('{"svg": "https://flagcdn.com/us.svg", "png": "https://flagcdn.com/w320/us.png"}');
      final Flags flags = Flags.fromJson(jsonMap);

      expect(flags.svg, 'https://flagcdn.com/us.svg');
      expect(flags.png, 'https://flagcdn.com/w320/us.png');
    });
  });
}

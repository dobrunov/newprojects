import 'package:flutter/material.dart';

import '../../../models/country.dart';
import '../../../widgets/buttons/image_code_button.dart';
import 'country_name_widget.dart';

class CountryCodeTile extends StatelessWidget {
  const CountryCodeTile({
    super.key,
    required this.country,
  });

  final Country country;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 20,
          width: 90,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ImageCodeButton(
            flags: country.flags.png,
            codes: country.callingCodes.first,
          ),
        ),
        const SizedBox(width: 12),
        CountryNameWidget(countryName: country.name),
      ],
    );
  }
}

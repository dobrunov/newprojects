import 'package:flutter/material.dart';

import '../styles/styles.dart';

class CountryNameWidget extends StatelessWidget {
  const CountryNameWidget({
    Key? key,
    required this.countryName,
  }) : super(key: key);

  final String countryName;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            countryName,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Color(0xFFFFFFFF),
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

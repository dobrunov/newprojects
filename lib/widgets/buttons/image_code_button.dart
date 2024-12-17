import 'package:flutter/material.dart';

import '../../styles/styles.dart';

class ImageCodeButton extends StatelessWidget {
  const ImageCodeButton({
    super.key,
    required this.flags,
    required this.codes,
  });

  final String flags;
  final String codes;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(4.0),
        child: Image.network(flags, width: 24.0, height: 20.0, fit: BoxFit.fill),
      ),
      Text(
        '+$codes',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: countryCodeText,
      ),
    ]);
  }
}

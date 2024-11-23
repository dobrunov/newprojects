import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../provider/country_provider.dart';
import '../../styles/styles.dart';

class SearchFieldWidget extends StatelessWidget {
  const SearchFieldWidget({
    Key? key,
    required TextEditingController controller,
  })  : _controller = controller,
        super(key: key);

  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      margin: const EdgeInsets.only(top: 1, bottom: 10.0),
      decoration: BoxDecoration(
        color: lightField,
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextField(
        controller: _controller,
        style: const TextStyle(color: textColor),
        textAlignVertical: TextAlignVertical.center,
        onChanged: (value) {
          Provider.of<CountryProvider>(context, listen: false).changeSearchString(value);
        },
        cursorColor: textColor,
        decoration: InputDecoration(
          focusColor: textColor,
          prefixIcon: SvgPicture.asset('images/search_icon.svg', height: 10, width: 10, fit: BoxFit.scaleDown),
          border: InputBorder.none,
          isCollapsed: true,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          hintText: 'Enter country name or code',
          hintStyle: const TextStyle(color: textColor),
        ),
      ),
    );
  }
}

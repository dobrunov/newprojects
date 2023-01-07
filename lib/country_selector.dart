import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:phone_number_input_fromscratch/provider/country_provider.dart';
import 'package:phone_number_input_fromscratch/styles/styles.dart';
import 'package:phone_number_input_fromscratch/widgets/init_flag_code.dart';
import 'package:provider/provider.dart';

import 'models/country.dart';

// import 'package:google_fonts/google_fonts.dart';

class CountrySelector extends StatefulWidget {
  const CountrySelector({Key? key}) : super(key: key);

  @override
  State<CountrySelector> createState() => _CountrySelectorState();
}

class _CountrySelectorState extends State<CountrySelector> {
  List<Country> countries = [];

  var isLoaded = false;

  final _controller = TextEditingController();
  late String _searchText;

  String _initFlag = InitFlagCode().initFlag;
  String _initCode = InitFlagCode().initCode;

  // set setFlag(String name) => _initFlag = name;

  @override
  void initState() {
    _controller.addListener(
      () {
        setState(() {
          _searchText = _controller.text;
        });
      },
    );
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<CountryProvider>(context, listen: false).getAllCountries();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // _
    return TextButton(
        onPressed: () {
          _onButtonPressed();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(4.0),
              child: Image.network(_initFlag,
                  width: 24.0, height: 20.0, fit: BoxFit.fill),
            ),
            const SizedBox(width: 6),
            Text(
              _initCode,
              style: phoneNumberText,
            ),
          ],
        ));
  }

  void _onButtonPressed() {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: background,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 20, 20.0, 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Country code', style: header1),
                    Container(
                      height: 20,
                      width: 20,
                      padding: const EdgeInsets.all(1),
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        color: lightField,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                          _controller.clear();
                        },
                        padding: EdgeInsets.zero,
                        icon: const Icon(Icons.close),
                        iconSize: 15.0,
                        color: textColor,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
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
                          Provider.of<CountryProvider>(context, listen: false)
                              .changeSearchString(value);
                        },
                        cursorColor: textColor,
                        decoration: InputDecoration(
                          focusColor: textColor,

                          prefixIcon: SvgPicture.asset('images/search_icon.svg',
                              height: 10, width: 10, fit: BoxFit.scaleDown),
                          //
                          border: InputBorder.none,
                          isCollapsed: true,
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          hintText: 'Enter country name or code',
                          hintStyle: const TextStyle(color: textColor),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.72,
                      child: Consumer<CountryProvider>(
                        builder: (context, value, child) {
                          if (value.isLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }

                          final countries = value.bestCountries;
                          return ListView.builder(
                            keyboardDismissBehavior:
                                ScrollViewKeyboardDismissBehavior.onDrag,
                            shrinkWrap: true,
                            itemCount: countries.length,
                            itemBuilder: (context, index) {
                              final country = countries[index];
                              return Container(
                                padding: const EdgeInsets.all(16),
                                decoration: const BoxDecoration(
                                  color: background,
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    _selectItem((country.flags.png),
                                        ('+${country.callingCodes.first}'));

                                    _controller.clear();

                                    Provider.of<CountryProvider>(context,
                                            listen: false)
                                        .changeSearchString('');
                                  },
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 20,
                                        width: 90,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(4.0),
                                                child: Image.network(
                                                    country.flags.png,
                                                    width: 24.0,
                                                    height: 20.0,
                                                    fit: BoxFit.fill),
                                              ),
                                              Text(
                                                '+${country.callingCodes.first}',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: countryCodeText,
                                              ),
                                            ]),
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              country.name,
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                              style: countryNameText,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),

              ///
            ],
          );
        });
  }

  _selectItem(String initFlag, String initCode) {
    Navigator.pop(context);
    setState(() {
      _initFlag = initFlag;
      _initCode = initCode;

      ///
    });
  }
}

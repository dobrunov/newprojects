import 'package:flutter/material.dart';

import 'package:phone_number_input_fromscratch/provider/country_provider.dart';
import 'package:phone_number_input_fromscratch/styles/styles.dart';
import 'package:phone_number_input_fromscratch/widgets/buttons/country_button_content.dart';
import 'package:phone_number_input_fromscratch/widgets/country_code_tile.dart';
import 'package:phone_number_input_fromscratch/utils/init_flag_code.dart';
import 'package:phone_number_input_fromscratch/widgets/modal_label.dart';
import 'package:phone_number_input_fromscratch/widgets/fields/search_field_widget.dart';
import 'package:provider/provider.dart';

class CountrySelector extends StatefulWidget {
  const CountrySelector({Key? key}) : super(key: key);

  @override
  State<CountrySelector> createState() => _CountrySelectorState();
}

class _CountrySelectorState extends State<CountrySelector> {

  var isLoaded = false;

  final _controller = TextEditingController();
  late String _searchText;

  String _initFlag = InitFlagCode().initFlag;
  String _initCode = InitFlagCode().initCode;

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
    ///
    return TextButton(
      child: CountryButtonContent(
        initFlag: _initFlag,
        initCode: _initCode,
      ),
      onPressed: () {
        _onButtonPressed();
      },
    );
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
                child:

                    /// LABEL
                    ModalLabel(controller: _controller),
              ),

              ///
              const SizedBox(height: 8),
              Padding(
                padding: paddingLeftRight20,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    /// SEARCH FIELD
                    SearchFieldWidget(controller: _controller),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.72,
                      child: Consumer<CountryProvider>(
                        builder: (context, value, child) {
                          if (value.isLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }

                          /// COUNTRY CODE LIST
                          final countries = value.bestCountries;
                          return ListView.builder(
                            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
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
                                    _selectItem((country.flags.png), ('+${country.callingCodes.first}'));
                                    _controller.clear();
                                    //
                                    Provider.of<CountryProvider>(context, listen: false).changeSearchString('');
                                  },
                                  child: CountryCodeTile(country: country),
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

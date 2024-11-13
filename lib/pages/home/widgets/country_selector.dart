import 'package:flutter/material.dart';
import 'package:phone_number_input_fromscratch/provider/country_provider.dart';
import 'package:phone_number_input_fromscratch/styles/styles.dart';
import 'package:phone_number_input_fromscratch/widgets/buttons/country_button_content.dart';
import 'package:phone_number_input_fromscratch/pages/home/widgets/modal_header.dart';
import 'package:phone_number_input_fromscratch/widgets/fields/search_field_widget.dart';
import 'package:provider/provider.dart';

import '../../../models/country.dart';
import 'country_code_tile.dart';

class CountrySelector extends StatefulWidget {
  const CountrySelector({Key? key}) : super(key: key);

  @override
  State<CountrySelector> createState() => _CountrySelectorState();
}

class _CountrySelectorState extends State<CountrySelector> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Fetch countries only once after frame is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CountryProvider>().getAllCountries();
    });

    _controller.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _controller.removeListener(_onSearchChanged);
    _controller.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    context.read<CountryProvider>().changeSearchString(_controller.text);
  }

  @override
  Widget build(BuildContext context) {
    // Obtain flag and code from provider directly
    final countryProvider = context.watch<CountryProvider>();

    return TextButton(
      onPressed: _showCountrySelectorSheet,
      child: CountryButtonContent(
        initFlag: countryProvider.selectedFlag,
        initCode: countryProvider.selectedCode,
      ),
    );
  }

  void _showCountrySelectorSheet() {
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: background,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      context: context,
      builder: (context) => _CountrySelectorSheet(controller: _controller),
    );
  }
}

class _CountrySelectorSheet extends StatelessWidget {
  final TextEditingController controller;

  const _CountrySelectorSheet({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddingLeftRight20,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 20, 20.0, 15),
            child: ModalHeader(controller: controller),
          ),
          const SizedBox(height: 8),
          SearchFieldWidget(controller: controller),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.72,
            child: Consumer<CountryProvider>(
              builder: (context, countryProvider, child) {
                if (countryProvider.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                return CountryList(countries: countryProvider.bestCountries);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CountryList extends StatelessWidget {
  final List<Country> countries;

  const CountryList({super.key, required this.countries});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      shrinkWrap: true,
      itemCount: countries.length,
      itemBuilder: (context, index) {
        final country = countries[index];
        return GestureDetector(
          onTap: () {
            final countryProvider = context.read<CountryProvider>();
            countryProvider.selectCountry(
              flagUrl: country.flags.png,
              code: '+${country.callingCodes.first}',
            );
            Navigator.pop(context);
          },
          child: CountryCodeTile(country: country),
        );
      },
    );
  }
}

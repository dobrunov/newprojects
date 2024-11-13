import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/telephone_number_result_controller.dart';
import '../../styles/styles.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final telephoneNumberResult = context.watch<TelephoneNumberResultController>();
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: background),
      home: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                telephoneNumberResult.telephoneNumberResult,
                style: const TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              const SizedBox(height: 50),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.close,
                  size: 20.0,
                ),
              ),
              const Text('Back'),
            ],
          ),
        ),
      ),
    );
  }
}

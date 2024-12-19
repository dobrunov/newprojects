import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/telephone_number_result_controller.dart';
import '../../styles/styles.dart';

class CallPage extends StatefulWidget {
  const CallPage({super.key});

  @override
  State<CallPage> createState() => CallPageState();
}

class CallPageState extends State<CallPage> {
  @override
  Widget build(BuildContext context) {
    final telephoneNumberResult = context.watch<TelephoneNumberResultController>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF594C74)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Call page',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              telephoneNumberResult.telephoneNumberResult,
              style: const TextStyle(
                color: Color(0xFF594C74),
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controllers/text_controller.dart';
import '../../../styles/styles.dart';

class ModalHeader extends StatelessWidget {
  const ModalHeader({
    Key? key,
    required TextEditingController controller,
  })  : _controller = controller,
        super(key: key);

  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Header text
        const Text(
          'Country code',
          style: TextStyle(
            color: Color(0xFFFFFFFF),
            fontWeight: FontWeight.bold,
            fontSize: 32,
          ),
        ),
        // Close button
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
            color: const Color(0xFF594C74),
          ),
        ),
      ],
    );
  }
}

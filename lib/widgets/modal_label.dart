import 'package:flutter/material.dart';

import '../styles/styles.dart';

class ModalLabel extends StatelessWidget {
  const ModalLabel({
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
    );
  }
}

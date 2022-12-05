import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  const InputWidget({
    Key? key,
    this.onChanged,
    required this.value,
    required this.label,
  }) : super(key: key);

  final Function(String value)? onChanged;
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black54,
            fontStyle: FontStyle.normal,
          ),
        ),
        const SizedBox(height: 12,),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color.fromRGBO(237, 237, 237, 1),
          ),
          child: TextField(
            style: const TextStyle(fontSize: 18),
            decoration: InputDecoration(
              labelText: value,
              border: InputBorder.none,
            ),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}

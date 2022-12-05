import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  const InputWidget({
    Key? key,
    this.onChanged,
    required this.value,
    required this.label,
    this.isSecured = false,
  }) : super(key: key);

  final Function(String value)? onChanged;
  final String value;
  final String label;
  final bool isSecured;

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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextFormField(
              obscureText: isSecured,
              autocorrect: !isSecured,
              enableSuggestions: !isSecured,
              initialValue: value,
              style: const TextStyle(fontSize: 18),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: label,
              ),
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    Key? key,
    required this.hint,
    this.prefixIcon,
    this.suffixIcon,
    required this.onPressed,
  }) : super(key: key);

  final String hint;
  final Icon? prefixIcon;
  final Icon? suffixIcon;

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color.fromRGBO(237, 237, 237, 1),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: TextFormField(
          enabled: false,
          style: const TextStyle(fontSize: 18),
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            hintText: hint,
          ),
        ),
      ),
    );
  }
}

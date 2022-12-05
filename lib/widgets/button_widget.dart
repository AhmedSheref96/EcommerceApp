import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    Key? key,
    this.onpressed,
    required this.title,
    required this.icon,
    this.color,
  }) : super(key: key);

  final Function()? onpressed;
  final String title;
  final Icon icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onpressed,
      height: 45,
      color: color ?? const Color.fromRGBO(54, 105, 201, 1),
    );
  }
}

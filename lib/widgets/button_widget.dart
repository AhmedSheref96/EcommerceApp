import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/colors.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    Key? key,
    this.onpressed,
    required this.title,
    this.titleColor,
    this.icon,
    this.color,
  }) : super(key: key);

  final Function()? onpressed;
  final String title;
  final Color? titleColor;
  final Icon? icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onpressed,
      height: 45,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      color: color ?? primaryColor,
      child: Center(
        child: Text(
          title.capitalize ?? "",
          style: TextStyle(color: titleColor ?? Colors.white),
        ),
      ),
    );
  }

}

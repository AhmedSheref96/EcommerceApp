import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  const InputWidget(
      {Key? key,
      required this.onSaved,
      this.label,
      required this.hint,
      this.isSecured = false,
      this.prefixIcon,
      this.suffixIcon,
      this.autofocus = false,
      this.enabled = true,
      this.onPressed})
      : super(key: key);

  final  void Function(String? value) onSaved;
  final String? label;
  final String hint;
  final bool isSecured;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final bool autofocus;
  final bool enabled;

  final Function? onPressed;

  @override
  Widget build(BuildContext context) {
    FocusNode focusNode = FocusNode();
    Widget widget = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Text(
            label!,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black54,
              fontStyle: FontStyle.normal,
            ),
          )
        else
          const SizedBox(width: 0, height: 0),
        const SizedBox(
          height: 12,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color.fromRGBO(237, 237, 237, 1),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextFormField(
              enabled: enabled,
              onTap: () => onPressed,
              obscureText: isSecured,
              autocorrect: !isSecured,
              autofocus: autofocus,
              focusNode: FocusNode(),
              enableSuggestions: !isSecured,
              style: const TextStyle(fontSize: 18),
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: prefixIcon,
                suffixIcon: suffixIcon,
                hintText: hint,
              ),
              onSaved: (value)=> onSaved(value),
            ),
          ),
        ),
      ],
    );
    if (autofocus) FocusScope.of(context).requestFocus(focusNode);
    return widget;
  }
}

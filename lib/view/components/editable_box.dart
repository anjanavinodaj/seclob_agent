import 'package:flutter/material.dart';
import 'package:seclob_agent/view/providers/colors.dart';

class EditableBox extends StatelessWidget {
  const EditableBox({
    Key? key,
    required this.controller,
    required this.name,
    required this.hint,
    required this.type,
    this.prefix = "",
    this.isPassword = false,
    this.maxLength = 100,
    this.icon,
    this.onPressed,
    this.onChanged,
    this.validator,
  }) : super(key: key);

  final TextEditingController controller;
  final String name;
  final String hint;
  final TextInputType type;
  final GestureTapCallback? onPressed;
  final Icon? icon;
  final bool isPassword;
  final int maxLength;
  final String prefix;
  final Function(String value)? onChanged;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 15),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              name,
              textAlign: TextAlign.left,
              style: const TextStyle(
                color: inputTextcolor,
                fontSize: 12,
                // fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 6),
          child: TextFormField(
            obscureText: isPassword,
            keyboardType: type,
            maxLength: maxLength,
            // onChanged: onChanged!,
            validator: validator,
            decoration: InputDecoration(
              counterText: "",
              prefix: Text(
                prefix,
                style: const TextStyle(color: Colors.black),
              ),
              suffixIcon: icon != null
                  ? IconButton(
                      icon: icon!,
                      onPressed: () => {onPressed!()},
                    )
                  : null,
              alignLabelWithHint: true,
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: bordercolor),
                borderRadius: BorderRadius.circular(10.0),
              ),
              hintText: hint,
              contentPadding: const EdgeInsets.only(left: 15, right: 15),
              hintStyle:
                  const TextStyle(fontSize: 13, color: inputsecondTextcolor),
            ),
            controller: controller,
          ),
        ),
      ],
    );
  }
}

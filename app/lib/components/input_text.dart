import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputText extends StatelessWidget {
  const InputText({
    super.key,
    required this.hintText,
    required this.backgroundColor,
    required this.iconData,
    required this.inputType,
    required this.isController,
    this.inputFormatter = false,
  });

  final IconData iconData;
  final String hintText;
  final Color backgroundColor;
  final TextInputType inputType;
  final bool inputFormatter;
  final TextEditingController isController;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.7,
      decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: const Color.fromRGBO(12, 17, 23, 1)),
          borderRadius: BorderRadius.circular(30)),
      child: TextFormField(
        controller: isController,
        inputFormatters: inputFormatter
            ? <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]"))
              ]
            : null,
        keyboardType: inputType,
        decoration: InputDecoration(
            icon: Icon(
              iconData,
              color: const Color.fromRGBO(59, 81, 108, 1),
            ),
            hintText: hintText,
            border: InputBorder.none),
      ),
    );
  }
}

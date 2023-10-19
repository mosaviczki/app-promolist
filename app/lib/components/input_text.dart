import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputText extends StatelessWidget {
  const InputText({
    super.key,
    required this.hintText,
    required this.backgroundColor,
    this.iconData,
    required this.inputType,
    required this.isController,
    this.inputFormatter = false,
  });

  final IconData? iconData;
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
      width: size.width * 0.8,
      child: TextFormField(
        controller: isController,
        inputFormatters: inputFormatter
            ? <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]"))
              ]
            : null,
        keyboardType: inputType,
        validator: (value) {
          if (value!.isEmpty) {
            return 'O campo é obrigatória';
          }
          return null;
        },
        decoration: InputDecoration(
            prefixIcon: Icon(
              iconData,
              color: const Color.fromRGBO(59, 81, 108, 1),
            ),
            hintText: hintText,
            border: const OutlineInputBorder()),
      ),
    );
  }
}

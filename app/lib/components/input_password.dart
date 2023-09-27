import 'package:flutter/material.dart';

class InputPassword extends StatefulWidget {
  const InputPassword({
    super.key,
    required this.hintText,
    required this.backgroundColor,
    required this.isController,
  });

  final String hintText;
  final Color backgroundColor;
  final TextEditingController isController;
  @override
  State<InputPassword> createState() => _InputPasswordState();
}

class _InputPasswordState extends State<InputPassword> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      child: TextFormField(
        controller: widget.isController,
        obscureText: obscureText,
        decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.lock,
              color: Color.fromRGBO(59, 81, 108, 1),
            ),
            suffixIcon: togglePassword(),
            hintText: widget.hintText,
            border: const OutlineInputBorder()),
        keyboardType: TextInputType.visiblePassword,
        // ignore: body_might_complete_normally_nullable
        validator: (value) {
          if (value!.isEmpty) {
            return 'informe sua senha';
          } else if (value.length < 6) {
            return 'sua senha deve ter pelo menos 6 caracteres';
          }
        },
      ),
    );
  }

  Widget togglePassword() {
    return IconButton(
      onPressed: () {
        setState(() {
          obscureText = !obscureText;
        });
      },
      icon: obscureText
          ? const Icon(Icons.visibility)
          : const Icon(Icons.visibility_off),
      color: const Color.fromRGBO(82, 115, 156, 1),
    );
  }
}

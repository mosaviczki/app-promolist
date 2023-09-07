import 'package:flutter/material.dart';

class InputPassword extends StatefulWidget {
  const InputPassword(
      {super.key, required this.hintText, required this.backgroundColor});

  final String hintText;
  final Color backgroundColor;
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
      width: size.width * 0.7,
      decoration: BoxDecoration(
          color: widget.backgroundColor,
          border: Border.all(color: const Color.fromRGBO(12, 17, 23, 1)),
          borderRadius: BorderRadius.circular(30)),
      child: TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
            icon: const Icon(
              Icons.lock,
              color: Color.fromRGBO(59, 81, 108, 1),
            ),
            suffixIcon: togglePassword(),
            hintText: widget.hintText,
            border: InputBorder.none),
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


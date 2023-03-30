import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final double h;
  final String hint;
  final TextEditingController controller;
  final IconData? icon;
  final bool? isPassword;
  final GlobalKey<FormState>? formKey;
  final String? validatior;

  const CustomTextField({
    super.key,
    required this.h,
    required this.hint,
    required this.controller,
    this.formKey,
    this.icon,
    this.isPassword,
    this.validatior,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: h,
      child: TextFormField(
        key: formKey,
        controller: controller,
        obscureText: isPassword ?? false,
        style: TextStyle(color: Colors.white, fontSize: h * 0.4),
        cursorColor: Colors.white,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            color: Colors.grey[400],
          ),
        ),
      ),
    );
  }
}

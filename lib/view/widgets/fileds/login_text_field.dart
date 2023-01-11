import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final double h;
  final String hint;
  final TextEditingController controller;
  final IconData? icon;
  final bool? isPassword;

  const CustomTextField({
    super.key,
    required this.h,
    required this.hint,
    required this.controller,
    this.icon,
    this.isPassword,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: h,
      child: TextFormField(
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

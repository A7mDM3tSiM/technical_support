import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final double h;
  final String hint;
  final TextEditingController controller;
  final IconData? icon;
  final bool? isPassword;
  final Color? fill;
  final Color? textColor;
  final Color? crusorColor;

  const CustomTextField({
    super.key,
    required this.h,
    required this.hint,
    required this.controller,
    this.icon,
    this.isPassword,
    this.fill,
    this.textColor,
    this.crusorColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: h,
      child: TextFormField(
        controller: controller,
        obscureText: isPassword ?? false,
        style: TextStyle(
          color: textColor,
        ),
        cursorColor: crusorColor,
        decoration: InputDecoration(
          hintText: hint,
          fillColor: fill,
          hintStyle: TextStyle(
            color: Colors.grey[400],
          ),
          suffix: icon == null
              ? const SizedBox()
              : Icon(
                  icon,
                  size: h * 0.2,
                ),
        ),
      ),
    );
  }
}

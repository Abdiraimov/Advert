import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.maxLines,
    this.onTap,
  });
  final String hintText;
  final TextEditingController? controller;
  final int? maxLines;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      onTap: onTap,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        filled: true,
        hintText: hintText,
      ),
    );
  }
}
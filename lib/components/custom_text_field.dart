import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hintText,
    this.controller,
    this.maxLines,
    this.onTap, 
    this.prefixIcon, 
    this.focusNode,
  });
  final String? hintText;
  final TextEditingController? controller;
  final int? maxLines;
  final void Function()? onTap;
  final Widget? prefixIcon;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      onTap: onTap,
      focusNode: focusNode,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        border: const OutlineInputBorder(),
        filled: true,
        hintText: hintText,
      ),
    );
  }
}
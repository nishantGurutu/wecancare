import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  final String hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final TextInputType keyboardType;
  final Function(String)? onChanged;

  final bool filled;
  final Color? fillColor;
  final InputBorder? border;
  final EdgeInsetsGeometry? contentPadding;
  final double? hintFontSize;
  final Color? hintTextColor;
  final FontWeight? hintFontWeight;

  const CommonTextField({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.filled = true,
    this.fillColor,
    this.border,
    this.contentPadding,
    this.hintFontSize,
    this.hintTextColor,
    this.hintFontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: hintFontSize ?? 14, // Default 14
          color: hintTextColor ?? Colors.grey,
          fontWeight: hintFontWeight ?? FontWeight.normal,
        ),
        prefixIcon: prefixIcon != null
            ? Icon(prefixIcon, color: Colors.blue, size: 20)
            : null,
        suffixIcon: suffixIcon != null
            ? Icon(suffixIcon, color: Colors.black, size: 20)
            : null,
        filled: filled,
        fillColor: fillColor ?? Colors.white,
        contentPadding: contentPadding ??
            const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        border: border ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
      ),
    );
  }
}

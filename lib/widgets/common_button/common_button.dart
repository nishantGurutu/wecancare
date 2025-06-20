import 'package:flutter/material.dart';

import '../../utils/app_colors/app_colors.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color color;
  final Color textColor;

  const CommonButton({
    super.key,
    required this.text,
    required this.onTap,
    this.color = AppColors.primary,
    this.textColor = AppColors.white,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize: const Size(double.infinity, 42),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(text, style: TextStyle(color: textColor, fontSize: 15)),
    );
  }
}

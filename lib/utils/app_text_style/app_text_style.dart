import 'package:flutter/material.dart';

import '../app_colors/app_colors.dart';

class AppTextStyles {
  static const TextStyle heading = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
  );

  static const TextStyle subheading = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w400,
    color: AppColors.textDark,
  );

  static const TextStyle normal = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.textDark,
  );

  static const TextStyle hint = TextStyle(
    fontSize: 15,
    color: AppColors.textLight,
    fontWeight: FontWeight.w500,
  );
}

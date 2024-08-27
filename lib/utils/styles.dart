import 'package:cats/utils/colors.dart';
import 'package:flutter/material.dart';

class AppStyles {
  static TextStyle display = TextStyle(
    fontSize: 42,
    color: AppColors.textColor,
    fontWeight: FontWeight.w700,
  );
  static TextStyle title = TextStyle(
    fontSize: 24,
    color: AppColors.textColor,
    fontWeight: FontWeight.w700,
  );

  static TextStyle subtitleLarge = TextStyle(
    fontSize: 20,
    color: AppColors.textColor,
    fontWeight: FontWeight.w600,
  );

  static TextStyle subtitleSmall = TextStyle(
    fontSize: 18,
    color: AppColors.textColor,
    fontWeight: FontWeight.w600,
  );

  static TextStyle body = TextStyle(
    fontSize: 16,
    color: AppColors.textColor,
    fontWeight: FontWeight.w500,
  );

  static TextStyle hint = TextStyle(
    fontSize: 16,
    color: AppColors.hintTextColor,
    fontWeight: FontWeight.w700,
  );
}

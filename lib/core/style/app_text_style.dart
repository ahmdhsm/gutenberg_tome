import 'package:flutter/material.dart';
import 'package:gutenberg_tome/core/style/app_color.dart';

class AppTextStyle {
  static header({Color? color}) {
    return TextStyle(
      color: color ?? AppColor.primaryText,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    );
  }

  static caption({Color? color}) {
    return TextStyle(
      color: color ?? AppColor.primaryText,
      fontSize: 15,
      fontWeight: FontWeight.w400,
    );
  }
}

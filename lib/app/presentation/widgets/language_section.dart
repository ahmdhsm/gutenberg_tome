import 'package:flutter/material.dart';
import 'package:gutenberg_tome/core/style/app_color.dart';

class LanguageSection extends StatelessWidget {
  const LanguageSection({
    super.key,
    required this.language,
  });

  final String language;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.language,
          color: AppColor.primaryText,
          size: 20,
        ),
        const SizedBox(width: 10),
        Text(
          language,
          style: TextStyle(
            color: AppColor.primaryText,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

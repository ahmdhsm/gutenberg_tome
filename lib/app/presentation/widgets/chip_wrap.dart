import 'package:flutter/material.dart';
import 'package:gutenberg_tome/core/style/app_color.dart';
import 'package:gutenberg_tome/core/style/app_text_style.dart';

class ChipWrap extends StatelessWidget {
  const ChipWrap({
    super.key,
    required this.values,
    required this.title,
  });

  final String title;
  final List<String> values;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title,
              style: TextStyle(
                color: AppColor.primaryText,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Wrap(
          spacing: 10,
          children: [
            for (final value in values)
              Chip(
                label: Text(
                  value,
                  style: AppTextStyle.caption(
                    color: AppColor.background,
                  ),
                ),
                labelStyle: TextStyle(color: AppColor.buttonText),
                padding: const EdgeInsets.symmetric(
                  horizontal: 2,
                ),
                backgroundColor: AppColor.accentColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
          ],
        ),
      ],
    );
  }
}

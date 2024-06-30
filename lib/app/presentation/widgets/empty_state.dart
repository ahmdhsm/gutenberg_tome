import 'package:flutter/widgets.dart';
import 'package:gutenberg_tome/core/style/app_text_style.dart';
import 'package:gutenberg_tome/l10n/l10n.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        context.l10n.noBook,
        style: AppTextStyle.header(),
      ),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gutenberg_tome/app/presentation/widgets/book_cover.dart';
import 'package:gutenberg_tome/app/presentation/widgets/chip_wrap.dart';
import 'package:gutenberg_tome/app/presentation/widgets/language_section.dart';
import 'package:gutenberg_tome/core/style/app_color.dart';
import 'package:gutenberg_tome/l10n/l10n.dart';

@RoutePage()
class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final subject = [
    "Bildungsromans",
    "City and town life -- Fiction",
    "Didactic fiction",
    "Domestic fiction",
    "England -- Fiction",
    "Love stories",
    "Married people -- Fiction",
    "Young women -- Fiction"
  ];

  final bookshelves = [
    "Bildungsromans",
    "tes2",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        // elevation: 0.0,
        backgroundColor: AppColor.background,
        iconTheme: IconThemeData(color: AppColor.buttonBackground),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(
              Icons.favorite_outline,
              size: 30,
              color: AppColor.buttonBackground,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BookCover(
              imageUrl:
                  "https://www.gutenberg.org/cache/epub/84/pg84.cover.medium.jpg",
            ),
            const SizedBox(height: 20),
            Text(
              'Romeo and Juliet Romeo and Juliet Romeo and Juliet Romeo and Juliet Romeo and Juliet',
              style: TextStyle(
                color: AppColor.primaryText,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Shakespeare, William',
              style: TextStyle(
                color: AppColor.primaryText,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 5),
            const LanguageSection(language: 'en'),
            const SizedBox(height: 5),
            const Divider(),
            ChipWrap(
              title: context.l10n.subject,
              values: subject,
            ),
            const SizedBox(height: 5),
            const Divider(),
            ChipWrap(
              title: context.l10n.bookshelves,
              values: bookshelves,
            ),
            SizedBox(
              height: MediaQuery.of(context).padding.bottom + 10,
            ),
          ],
        ),
      ),
    );
  }
}

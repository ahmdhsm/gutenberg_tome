import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gutenberg_tome/app/domain/entities/book_entity.dart';
import 'package:gutenberg_tome/core/route/app_router.dart';
import 'package:gutenberg_tome/core/style/app_color.dart';
import 'package:gutenberg_tome/core/style/app_text_style.dart';

class BookCard extends StatelessWidget {
  const BookCard({
    super.key,
    required this.book,
  });

  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushRoute(
          DetailRoute(book: book),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 15,
        ),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: AppColor.cardBackground,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.menu_book_rounded,
                  size: 20,
                  color: AppColor.primaryText,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              book.title,
              style: AppTextStyle.header(),
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              book.authorsLabel,
              style: AppTextStyle.caption(),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gutenberg_tome/app/presentation/widgets/book_card.dart';
import 'package:gutenberg_tome/app/presentation/widgets/search_field.dart';

class BookListContent extends StatefulWidget {
  const BookListContent({super.key});

  @override
  State<BookListContent> createState() => _BookListContentState();
}

class _BookListContentState extends State<BookListContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: 10,
            right: 10,
            bottom: 10,
            top: MediaQuery.of(context).padding.top,
          ),
          child: const SearchField(),
        ),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                child: BookCard(
                  title: 'Romeo And Juliet',
                  author: ['Shakespear'],
                ),
              );
            },
            itemCount: 20,
          ),
        ),
      ],
    );
  }
}

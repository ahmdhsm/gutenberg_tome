import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gutenberg_tome/app/presentation/cubits/favorite_book/favorite_book_cubit.dart';
import 'package:gutenberg_tome/app/presentation/widgets/book_card.dart';
import 'package:gutenberg_tome/app/presentation/widgets/empty_state.dart';

class FavoriteBookContent extends StatefulWidget {
  const FavoriteBookContent({super.key});

  @override
  State<FavoriteBookContent> createState() => _FavoriteBookContentState();
}

class _FavoriteBookContentState extends State<FavoriteBookContent> {
  FavoriteBookCubit? favoriteBookCubit;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      favoriteBookCubit = BlocProvider.of<FavoriteBookCubit>(
        context,
      );
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).padding.top,
        ),
        Expanded(
          child: BlocBuilder<FavoriteBookCubit, FavoriteBookState>(
            bloc: favoriteBookCubit,
            builder: (context, state) {
              if (state.books.isEmpty) {
                return const EmptyState();
              }
              return ListView.builder(
                physics: const ClampingScrollPhysics(),
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  final book = state.books[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    child: BookCard(
                      title: book.title,
                      author: book.authors.map((e) => e.name).toList(),
                      book: book,
                    ),
                  );
                },
                itemCount: state.books.length,
              );
            },
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gutenberg_tome/app/presentation/cubits/book_list/book_list_cubit.dart';
import 'package:gutenberg_tome/app/presentation/cubits/favorite_book/favorite_book_cubit.dart';
import 'package:gutenberg_tome/app/presentation/widgets/book_card.dart';
import 'package:gutenberg_tome/app/presentation/widgets/empty_state.dart';
import 'package:gutenberg_tome/app/presentation/widgets/search_field.dart';
import 'package:gutenberg_tome/core/style/app_color.dart';
import 'package:gutenberg_tome/core/style/app_text_style.dart';
import 'package:gutenberg_tome/l10n/l10n.dart';

class BookListContent extends StatefulWidget {
  const BookListContent({super.key});

  @override
  State<BookListContent> createState() => _BookListContentState();
}

class _BookListContentState extends State<BookListContent> {
  final _scrollController = ScrollController();

  BookListCubit? listBookCubit;
  FavoriteBookCubit? favoriteBookCubit;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(_loadMore);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      listBookCubit = BlocProvider.of<BookListCubit>(
        context,
      );
      favoriteBookCubit = BlocProvider.of<FavoriteBookCubit>(
        context,
      );
      setState(() {});
    });
  }

  void _loadMore() {
    final pixels = _scrollController.position.pixels;
    final maxScroll = _scrollController.position.maxScrollExtent;

    if (pixels == maxScroll) {
      listBookCubit?.loadMoreBook();
    }
  }

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
          child: BlocBuilder<BookListCubit, BookListState>(
            bloc: listBookCubit,
            builder: (context, state) {
              if (state.isOffline) {
                return Text(
                  'offline mode',
                  style: AppTextStyle.caption(color: Colors.red),
                );
              }
              return SearchField(
                placeholder: context.l10n.searchBookByTitle,
                onSearch: (value) async {
                  if (listBookCubit != null) {
                    listBookCubit?.getInitialBook(
                      searchQuery: value,
                    );
                  }
                },
              );
            },
          ),
        ),
        Expanded(
          child: BlocBuilder<BookListCubit, BookListState>(
            builder: (context, state) {
              if (state.isInitial) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state.results.isEmpty) {
                return const EmptyState();
              }
              if (state.results.isNotEmpty) {
                return Stack(
                  children: [
                    RefreshIndicator(
                      onRefresh: listBookCubit?.refresh ?? () async {},
                      child: ListView.builder(
                        physics: const ClampingScrollPhysics(),
                        controller: _scrollController,
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          final book = state.results[index];
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
                        itemCount: state.results.length,
                      ),
                    ),
                    if (state.isLoading)
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: AppColor.background.withOpacity(0.8),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(10),
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                        ),
                      ),
                  ],
                );
              }
              return Container();
            },
          ),
        ),
      ],
    );
  }
}

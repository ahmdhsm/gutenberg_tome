import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gutenberg_tome/app/presentation/cubits/book_list/book_list_cubit.dart';
import 'package:gutenberg_tome/app/presentation/cubits/favorite_book/favorite_book_cubit.dart';
import 'package:gutenberg_tome/main.dart';

@RoutePage()
class BlocProviderPage extends StatelessWidget {
  BlocProviderPage({super.key});

  final _bookCubit = getIt<BookListCubit>();
  final _favoritBookCubit = getIt<FavoriteBookCubit>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BookListCubit>(
          create: (BuildContext context) => _bookCubit,
        ),
        BlocProvider<FavoriteBookCubit>(
          create: (BuildContext context) => _favoritBookCubit,
        ),
      ],
      child: const AutoRouter(),
    );
  }
}

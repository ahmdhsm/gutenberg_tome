import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gutenberg_tome/app/domain/entities/book_entity.dart';
import 'package:gutenberg_tome/app/domain/repositories/favorite_book_repository.dart';
import 'package:injectable/injectable.dart';

part 'favorite_book_state.dart';
part 'favorite_book_cubit.freezed.dart';

@injectable
class FavoriteBookCubit extends Cubit<FavoriteBookState> {
  FavoriteBookCubit(this.repository) : super(FavoriteBookState.initial()) {
    getFavorite();
  }

  final FavoriteBookRepository repository;

  Future<void> addFavorite(BookEntity book) async {
    if (!isFavorite(id: book.id)) {
      await repository.addToFavorite(book: book);
    } else {
      await repository.removeFromFavorite(id: book.id);
    }
    await getFavorite();
  }

  Future<void> getFavorite() async {
    final result = await repository.getAllFavorite();
    result.fold((l) {}, (r) {
      emit(state.copyWith(books: r));
    });
  }

  bool isFavorite({required int id}) {
    final isExist = state.books.filter((e) => e.id == id).toList();

    return isExist.isNotEmpty;
  }
}

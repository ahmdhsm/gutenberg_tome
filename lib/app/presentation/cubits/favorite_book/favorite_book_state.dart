part of 'favorite_book_cubit.dart';

@freezed
class FavoriteBookState with _$FavoriteBookState {
  const factory FavoriteBookState({
    required List<BookEntity> books,
  }) = _FavoriteBookState;

  factory FavoriteBookState.initial() => const FavoriteBookState(
        books: [],
      );
}

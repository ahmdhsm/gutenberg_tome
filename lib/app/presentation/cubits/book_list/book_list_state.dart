part of 'book_list_cubit.dart';

@freezed
class BookListState with _$BookListState {
  const factory BookListState({
    required List<BookEntity> results,
    required bool isLoading,
    required bool isInitial,
    required bool isOffline,
    String? next,
    String? previous,
  }) = _BookListState;

  factory BookListState.initial() => const BookListState(
        results: [],
        isLoading: false,
        isInitial: true,
        isOffline: false,
      );
}

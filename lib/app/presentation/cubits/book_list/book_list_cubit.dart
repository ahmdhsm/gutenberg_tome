import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gutenberg_tome/app/domain/entities/book_entity.dart';
import 'package:gutenberg_tome/app/domain/repositories/book_repository.dart';
import 'package:injectable/injectable.dart';

part 'book_list_state.dart';
part 'book_list_cubit.freezed.dart';

@injectable
class BookListCubit extends Cubit<BookListState> {
  BookListCubit(this.repository) : super(BookListState.initial()) {
    getInitialBook(searchQuery: '');
  }

  final BookRepository repository;

  Future<void> getInitialBook({required String searchQuery}) async {
    emit(state.copyWith(isInitial: true));

    final result = await repository.getOnlineData(searchQuery: searchQuery);

    result.fold(
      (l) {
        getOfflineBook();
      },
      (r) {
        final data = r;
        final newState = state.copyWith(
          isOffline: false,
          results: data.results,
          next: data.next,
          previous: data.previous,
          isLoading: false,
          isInitial: false,
        );

        emit(newState);
      },
    );
  }

  Future<void> getOfflineBook() async {
    final result = await repository.getOfflineData();

    result.fold((l) {}, (r) {
      final data = r;
      final newState = state.copyWith(
        results: data.results,
        next: data.next,
        previous: data.previous,
        isLoading: false,
        isInitial: false,
        isOffline: true,
      );

      emit(newState);
    });
  }

  Future<void> loadMoreBook() async {
    if (state.isLoading) return;
    if (state.next == null) return;
    if (state.isOffline) return;

    emit(state.copyWith(isLoading: true));

    final result = await repository.loadMoreData(nextUrl: state.next ?? '');

    result.fold(
      (l) {},
      (r) {
        final data = r;
        final newBooks = data.results;
        final books = [...state.results, ...newBooks];

        final newState = state.copyWith(
          results: books,
          next: data.next,
          previous: data.previous,
          isLoading: false,
          isInitial: false,
        );

        emit(newState);
      },
    );
  }

  Future<void> refresh() async {
    getInitialBook(searchQuery: '');
  }
}

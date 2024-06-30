import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:gutenberg_tome/app/domain/entities/book_entity.dart';
import 'package:gutenberg_tome/app/domain/repositories/favorite_book_repository.dart';
import 'package:gutenberg_tome/app/presentation/cubits/favorite_book/favorite_book_cubit.dart';
import 'package:gutenberg_tome/core/model/failure.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'favorite_book_cubit_test.mocks.dart';

@GenerateMocks([FavoriteBookRepository])
void main() {
  final book1 = BookEntity(
    id: 1,
    title: 'title',
    authors: [],
    translators: [],
    subjects: [],
    bookshelves: [],
    languages: [],
    copyright: false,
    mediaType: '',
    formats: {},
    downloadCount: 0,
  );

  final book2 = BookEntity(
    id: 2,
    title: 'title',
    authors: [],
    translators: [],
    subjects: [],
    bookshelves: [],
    languages: [],
    copyright: false,
    mediaType: '',
    formats: {},
    downloadCount: 0,
  );

  final repository = MockFavoriteBookRepository();

  late FavoriteBookCubit cubit;

  setUpAll(() {
    cubit = FavoriteBookCubit(repository);
  });

  test('Cubit is initial', () {
    expect(cubit.state.books.length, 0);
  });

  test('Add favorite book', () async {
    provideDummy<Either<Failure, int>>(
      const Left(Failure.connection()),
    );

    provideDummy<Either<Failure, List<BookEntity>>>(
      const Left(Failure.connection()),
    );

    when(repository.addToFavorite(
      book: anyNamed('book'),
    )).thenAnswer(
      (_) async => right(1),
    );

    when(repository.getAllFavorite()).thenAnswer(
      (_) async => right([book1]),
    );

    await cubit.addFavorite(book1);
    expect(cubit.state.books.length, 1);
  });

  test('Add favorite book', () async {
    provideDummy<Either<Failure, int>>(
      const Left(Failure.connection()),
    );

    provideDummy<Either<Failure, List<BookEntity>>>(
      const Left(Failure.connection()),
    );

    when(repository.addToFavorite(
      book: anyNamed('book'),
    )).thenAnswer(
      (_) async => right(1),
    );

    when(repository.getAllFavorite()).thenAnswer(
      (_) async => right([book1, book2]),
    );

    await cubit.addFavorite(book2);
    expect(cubit.state.books.length, 2);
  });

  test('Remove favorite book', () async {
    provideDummy<Either<Failure, int>>(
      const Left(Failure.connection()),
    );

    provideDummy<Either<Failure, List<BookEntity>>>(
      const Left(Failure.connection()),
    );

    when(repository.removeFromFavorite(
      id: anyNamed('id'),
    )).thenAnswer(
      (_) async => right(1),
    );

    when(repository.getAllFavorite()).thenAnswer(
      (_) async => right([book1]),
    );

    await cubit.addFavorite(book1);
    expect(cubit.state.books.length, 1);
  });
}

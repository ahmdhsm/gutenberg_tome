import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:gutenberg_tome/app/data/datasources/favorite_book_local_data_source.dart';
import 'package:gutenberg_tome/app/data/model/book_model.dart';
import 'package:gutenberg_tome/app/domain/entities/book_entity.dart';
import 'package:gutenberg_tome/app/domain/repositories/favorite_book_repository.dart';
import 'package:gutenberg_tome/core/model/failure.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'favorite_book_repository_test.mocks.dart';

@GenerateMocks([FavoriteBookLocalDataSource])
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

  final mockLocalDataSource = MockFavoriteBookLocalDataSource();
  late FavoriteBookRepository repository;

  setUpAll(() {
    repository = FavoriteBookRepository(
      localDataSource: mockLocalDataSource,
    );
  });

  test('should return item', () async {
    provideDummy<Either<Failure, List<BookModel>>>(
      const Left(Failure.connection()),
    );

    when(mockLocalDataSource.getFavorite()).thenAnswer(
      (_) async => right(<BookModel>[BookModel(id: 1)]),
    );

    final result = await repository.getAllFavorite();

    result.fold(
      (l) {},
      (r) {
        expect(r.length, 1);
      },
    );
  });

  test('should return id after add to favorite', () async {
    provideDummy<Either<Failure, int>>(
      const Left(Failure.connection()),
    );

    when(mockLocalDataSource.addFavorite(
      book: anyNamed('book'),
    )).thenAnswer(
      (_) async => right(1),
    );

    final result = await repository.addToFavorite(book: book1);

    result.fold(
      (l) {},
      (r) {
        expect(r, 1);
      },
    );
  });

  test('should return id after remove from favorite', () async {
    provideDummy<Either<Failure, int>>(
      const Left(Failure.connection()),
    );

    when(mockLocalDataSource.removeFavorite(
      id: anyNamed('id'),
    )).thenAnswer(
      (_) async => right(1),
    );

    final result = await repository.removeFromFavorite(id: 1);

    result.fold(
      (l) {},
      (r) {
        expect(r, 1);
      },
    );
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:gutenberg_tome/app/data/datasources/book_local_data_source.dart';
import 'package:gutenberg_tome/app/data/datasources/book_remote_data_source.dart';
import 'package:gutenberg_tome/app/data/model/api_response_model.dart';
import 'package:gutenberg_tome/app/data/model/book_model.dart';
import 'package:gutenberg_tome/app/domain/repositories/book_repository.dart';
import 'package:gutenberg_tome/core/model/failure.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'book_repository_test.mocks.dart';

@GenerateMocks([BookLocalDataSource, BookRemoteDataSource])
void main() {
  final mockLocalDataSource = MockBookLocalDataSource();
  final mockRemoteDataSource = MockBookRemoteDataSource();
  late BookRepository repository;

  setUpAll(() {
    repository = BookRepository(
      localDataSource: mockLocalDataSource,
      remoteDataSource: mockRemoteDataSource,
    );
  });

  test('should return item', () async {
    provideDummy<Either<Failure, ApiResponseModel>>(
      const Left(Failure.connection()),
    );

    provideDummy<Either<Failure, List<BookModel>>>(
      const Left(Failure.connection()),
    );

    provideDummy<Either<Failure, void>>(
      const Left(Failure.connection()),
    );

    when(mockLocalDataSource.getData()).thenAnswer(
      (_) async => right(<BookModel>[BookModel(id: 1)]),
    );

    when(mockLocalDataSource.writeData(books: anyNamed('books'))).thenAnswer(
      (_) async => right(null),
    );

    when(mockLocalDataSource.clearData()).thenAnswer(
      (_) async => right(null),
    );

    when(mockRemoteDataSource.getList(searchQuery: anyNamed('searchQuery')))
        .thenAnswer(
      (_) async => right(ApiResponseModel(
        count: 1,
        results: [BookModel(id: 1)],
      )),
    );

    final result = await repository.getOnlineData(searchQuery: '');

    result.fold(
      (l) {},
      (r) {
        expect(r.results.length, 1);
      },
    );
  });
}

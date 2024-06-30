import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:gutenberg_tome/app/domain/entities/api_response_entity.dart';
import 'package:gutenberg_tome/app/domain/repositories/book_repository.dart';
import 'package:gutenberg_tome/app/presentation/cubits/book_list/book_list_cubit.dart';
import 'package:gutenberg_tome/core/model/failure.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'book_list_cubit_test.mocks.dart';

@GenerateMocks([BookRepository])
void main() {
  final repository = MockBookRepository();

  late BookListCubit cubit;

  setUpAll(() {
    cubit = BookListCubit(repository);
  });

  test('Cubit is initial', () {
    expect(cubit.state.results.length, 0);
  });

  test('Load initial data', () async {
    provideDummy<Either<Failure, ApiResponseEntity>>(
      const Left(Failure.connection()),
    );

    when(repository.getOnlineData(
      searchQuery: anyNamed('searchQuery'),
    )).thenAnswer(
      (_) async => right(ApiResponseEntity(count: 0, results: [])),
    );

    await cubit.getInitialBook(searchQuery: '');
    expect(cubit.state.results.length, 0);
  });

  test('Load more data', () async {
    provideDummy<Either<Failure, ApiResponseEntity>>(
      const Left(Failure.connection()),
    );

    when(repository.getOnlineData(
      searchQuery: anyNamed('searchQuery'),
    )).thenAnswer(
      (_) async => right(ApiResponseEntity(count: 0, results: [])),
    );

    await cubit.loadMoreBook();
    expect(cubit.state.results.length, 0);
  });
}

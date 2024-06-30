import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:gutenberg_tome/app/data/datasources/book_remote_data_source.dart';
import 'package:gutenberg_tome/core/helper/dio_helper.dart';
import 'package:gutenberg_tome/core/model/failure.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../helper/mock_response.dart';
import 'book_remote_datasource_test.mocks.dart';

@GenerateMocks([DioHelper])
void main() {
  final mockBaseDio = MockDioHelper();

  test('method should return data based on response', () async {
    provideDummy<Either<Failure, Response<dynamic>>>(
      left(const Failure.connection()),
    );

    final dataSource = BookRemoteDataSource(mockBaseDio);

    when(mockBaseDio.get(
      url: anyNamed('url'),
      param: anyNamed('param'),
    )).thenAnswer(
      (_) async => Right(Response(
        requestOptions: RequestOptions(),
        statusCode: 200,
        data: mockResponse,
      )),
    );

    final test = await dataSource.getList(searchQuery: '');

    test.fold(
      (l) {},
      (r) {
        final data = r;
        expect(
          data.count,
          73853,
        );

        expect(
          data.previous,
          null,
        );
      },
    );
  });

  test('method should return error', () async {
    final dataSource = BookRemoteDataSource(mockBaseDio);

    when(mockBaseDio.get(
      url: anyNamed('url'),
      param: anyNamed('param'),
    )).thenAnswer(
      (_) async => const Left(
        Failure.dio(code: 429),
      ),
    );

    final test = await dataSource.getList(searchQuery: '');

    test.fold(
      (l) {
        final error = l;
        expect(
          error,
          isA<Failure>(),
        );
      },
      (r) {},
    );
  });
}

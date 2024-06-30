import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gutenberg_tome/core/helper/dio_helper.dart';
import 'package:gutenberg_tome/core/model/failure.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'dio_helper_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  final mockDio = MockDio();

  test('Should return success data', () async {
    final baseDio = DioHelper(mockDio);

    when(mockDio.get(any)).thenAnswer(
      (_) async => Response(
        requestOptions: RequestOptions(),
        statusCode: 200,
        data: {},
      ),
    );

    final test = await baseDio.get(
      url: '',
    );

    test.fold(
      (error) {},
      (data) {
        expect(
          data.data,
          {},
        );

        expect(
          data.statusCode,
          200,
        );
      },
    );
  });

  test('Should return error data', () async {
    final baseDio = DioHelper(mockDio);

    when(mockDio.get(any)).thenAnswer(
      (_) async => Response(
        requestOptions: RequestOptions(),
        statusCode: 429,
        data: {},
      ),
    );

    final test = await baseDio.get(
      url: '',
    );

    test.fold(
      (error) {
        expect(
          error,
          isA<Failure>(),
        );
      },
      (data) {},
    );
  });

  test('Should return bad response', () async {
    final baseDio = DioHelper(mockDio);

    when(mockDio.get(any)).thenThrow(
      DioException.badResponse(
        requestOptions: RequestOptions(),
        statusCode: 400,
        response: Response(requestOptions: RequestOptions()),
      ),
    );

    final tes = await baseDio.get(
      url: '',
    );

    tes.fold(
      (error) {
        expect(
          error.message,
          'Bad response',
        );
      },
      (data) {},
    );
  });

  test('Should return receive time out', () async {
    final baseDio = DioHelper(mockDio);

    when(mockDio.get(any)).thenThrow(
      DioException.receiveTimeout(
        requestOptions: RequestOptions(),
        timeout: const Duration(seconds: 1),
      ),
    );

    final tes = await baseDio.get(
      url: '',
    );

    tes.fold(
      (error) {
        expect(
          error.message,
          'Receive time out',
        );
      },
      (data) {},
    );
  });

  test('Should return send time out', () async {
    final baseDio = DioHelper(mockDio);

    when(mockDio.get(any)).thenThrow(
      DioException.connectionTimeout(
        requestOptions: RequestOptions(),
        timeout: const Duration(seconds: 1),
      ),
    );

    final tes = await baseDio.get(
      url: '',
    );

    tes.fold(
      (error) {
        expect(
          error.message,
          'Connection time out',
        );
      },
      (data) {},
    );
  });

  test('Should return send time out', () async {
    final baseDio = DioHelper(mockDio);

    when(mockDio.get(any)).thenThrow(
      DioException.sendTimeout(
        requestOptions: RequestOptions(),
        timeout: const Duration(seconds: 1),
      ),
    );

    final tes = await baseDio.get(
      url: '',
    );

    tes.fold(
      (error) {
        expect(
          error.message,
          'Send time out',
        );
      },
      (data) {},
    );
  });

  test('Should return connection error', () async {
    final baseDio = DioHelper(mockDio);

    when(mockDio.get(any)).thenThrow(
      DioException.connectionError(
        requestOptions: RequestOptions(),
        reason: '',
      ),
    );

    final tes = await baseDio.get(
      url: '',
    );

    tes.fold(
      (error) {
        expect(
          error.message,
          'Connection error',
        );
      },
      (data) {},
    );
  });
}

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:gutenberg_tome/core/model/failure.dart';
import 'package:injectable/injectable.dart';

@injectable
class DioHelper {
  DioHelper(this.dio);

  final Dio dio;

  Future<Either<Failure, Response>> get({
    required String url,
    Map<String, dynamic>? param,
  }) async {
    final paramArray = <String>[];
    if (param != null) {
      for (var key in param.keys) {
        paramArray.add('$key=${param[key]}');
      }
    }

    final finalUrl = paramArray.isEmpty ? url : '$url?${paramArray.join('&')}';

    try {
      final result = await dio.get(
        finalUrl,
      );

      if (result.statusCode == 200) {
        return right(result);
      } else {
        return Left(Failure.dio(
          code: result.statusCode,
          message: result.statusMessage,
        ));
      }
    } on DioException catch (e) {
      String errorMessage = '';
      if (e.type == DioExceptionType.badResponse) {
        errorMessage = 'Bad response';
      } else if (e.type == DioExceptionType.connectionTimeout) {
        errorMessage = 'Connection time out';
      } else if (e.type == DioExceptionType.receiveTimeout) {
        errorMessage = 'Receive time out';
      } else if (e.type == DioExceptionType.sendTimeout) {
        errorMessage = 'Send time out';
      } else if (e.type == DioExceptionType.connectionError) {
        return const Left(Failure.dio(message: 'Connection error'));
      }

      return Left(Failure.dio(message: errorMessage));
    } catch (error) {
      return Left(Failure.unexpected(message: error.toString()));
    }
  }
}

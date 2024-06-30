import 'package:fpdart/fpdart.dart';
import 'package:gutenberg_tome/app/data/model/api_response_model.dart';
import 'package:gutenberg_tome/core/const/app_url.dart';
import 'package:gutenberg_tome/core/helper/dio_helper.dart';
import 'package:gutenberg_tome/core/model/failure.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class BookRemoteDataSource {
  BookRemoteDataSource(this.dioHelper);

  final DioHelper dioHelper;

  Future<Either<Failure, ApiResponseModel>> getList({
    required String searchQuery,
  }) async {
    final param = <String, dynamic>{};

    if (searchQuery != '') {
      param.addAll({'search': searchQuery});
    }

    final result = await dioHelper.get(url: AppUrl.bookUrl, param: param);

    return result.fold(
      (failure) => left(failure),
      (result) {
        final data = result.data as Map<String, dynamic>;
        final book = ApiResponseModel.fromJson(data);
        return right(book);
      },
    );
  }

  Future<Either<Failure, ApiResponseModel>> loadMore({
    required String nextUrl,
  }) async {
    final result = await dioHelper.get(url: nextUrl);

    return result.fold(
      (failure) => left(failure),
      (result) {
        final data = result.data as Map<String, dynamic>;
        final book = ApiResponseModel.fromJson(data);
        return right(book);
      },
    );
  }
}

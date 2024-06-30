import 'package:fpdart/fpdart.dart';
import 'package:gutenberg_tome/app/data/datasources/book_local_data_source.dart';
import 'package:gutenberg_tome/app/data/datasources/book_remote_data_source.dart';
import 'package:gutenberg_tome/app/domain/entities/api_response_entity.dart';
import 'package:gutenberg_tome/core/model/failure.dart';
import 'package:injectable/injectable.dart';

@injectable
class BookRepository {
  BookRepository({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  final BookRemoteDataSource remoteDataSource;
  final BookLocalDataSource localDataSource;

  Future<Either<Failure, ApiResponseEntity>> getOnlineData({
    required String searchQuery,
  }) async {
    final result = await remoteDataSource.getList(searchQuery: searchQuery);

    return result.fold(
      (l) => left(l),
      (r) async {
        await localDataSource.clearData();

        await localDataSource.writeData(books: r.results ?? []);

        return right(r.mapToEntity());
      },
    );
  }

  Future<Either<Failure, ApiResponseEntity>> loadMoreData({
    required String nextUrl,
  }) async {
    final result = await remoteDataSource.loadMore(nextUrl: nextUrl);

    return result.fold(
      (l) => left(l),
      (r) => right(r.mapToEntity()),
    );
  }

  Future<Either<Failure, ApiResponseEntity>> getOfflineData() async {
    final result = await localDataSource.getData();

    return result.fold(
      (l) => left(l),
      (r) => right(
        ApiResponseEntity(
          count: r.length,
          results: r.map((e) => e.mapToEntity()).toList(),
        ),
      ),
    );
  }
}

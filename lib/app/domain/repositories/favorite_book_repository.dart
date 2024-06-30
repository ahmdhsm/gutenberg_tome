import 'package:fpdart/fpdart.dart';
import 'package:gutenberg_tome/app/data/datasources/favorite_book_local_data_source.dart';
import 'package:gutenberg_tome/app/data/model/book_model.dart';
import 'package:gutenberg_tome/app/domain/entities/book_entity.dart';
import 'package:gutenberg_tome/core/model/failure.dart';
import 'package:injectable/injectable.dart';

@injectable
class FavoriteBookRepository {
  FavoriteBookRepository({
    required this.localDataSource,
  });

  final FavoriteBookLocalDataSource localDataSource;

  Future<Either<Failure, int>> addToFavorite({
    required BookEntity book,
  }) async {
    final bookJson = BookModel.fromEntity(book);
    final result = await localDataSource.addFavorite(book: bookJson);

    return result.fold(
      (l) => left(l),
      (r) => right(r),
    );
  }

  Future<Either<Failure, List<BookEntity>>> getAllFavorite() async {
    final result = await localDataSource.getFavorite();

    return result.fold(
      (l) => left(l),
      (r) => right(r.map((e) => e.mapToEntity()).toList()),
    );
  }

  Future<Either<Failure, int>> removeFromFavorite({required int id}) async {
    final result = await localDataSource.removeFavorite(id: id);

    return result.fold(
      (l) => left(l),
      (r) => right(r),
    );
  }
}

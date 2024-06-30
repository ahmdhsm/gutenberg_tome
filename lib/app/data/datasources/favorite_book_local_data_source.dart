import 'package:fpdart/fpdart.dart';
import 'package:gutenberg_tome/app/data/model/book_model.dart';
import 'package:gutenberg_tome/core/model/failure.dart';
import 'package:gutenberg_tome/core/realm/realm_model.dart';
import 'package:injectable/injectable.dart';
import 'package:realm/realm.dart';

@Injectable()
class FavoriteBookLocalDataSource {
  FavoriteBookLocalDataSource(this.realm);

  final Realm realm;

  Future<Either<Failure, int>> addFavorite({
    required BookModel book,
  }) async {
    try {
      final realmBook = realm.find<BookFavoriteRealm>(book.id);
      if (realmBook != null) return right(book.id ?? 0);

      realm.write(
        () => realm.add<BookFavoriteRealm>(
          book.toFavoriteRealmObject(),
        ),
      );
      return right(book.id ?? 0);
    } catch (e) {
      return left(const Failure.unexpected());
    }
  }

  Future<Either<Failure, int>> removeFavorite({
    required int id,
  }) async {
    try {
      final book = realm.find<BookFavoriteRealm>(id);
      if (book != null) {
        realm.write(
          () => realm.delete<BookFavoriteRealm>(book),
        );
      }
      return right(id);
    } catch (e) {
      return left(const Failure.unexpected());
    }
  }

  Future<Either<Failure, List<BookModel>>> getFavorite() async {
    try {
      final books = realm.all<BookFavoriteRealm>();

      return right(books.map((e) => BookModel.fromRealmFavorite(e)).toList());
    } catch (e) {
      return left(const Failure.unexpected());
    }
  }
}

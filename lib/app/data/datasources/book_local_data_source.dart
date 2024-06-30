import 'package:fpdart/fpdart.dart';
import 'package:gutenberg_tome/app/data/model/book_model.dart';
import 'package:gutenberg_tome/core/model/failure.dart';
import 'package:gutenberg_tome/core/realm/realm_model.dart';
import 'package:injectable/injectable.dart';
import 'package:realm/realm.dart';

@Injectable()
class BookLocalDataSource {
  BookLocalDataSource(this.realm);

  final Realm realm;

  Future<Either<Failure, void>> clearData() async {
    try {
      realm.write(() => realm.deleteAll<BookRealm>());
      return right(null);
    } catch (e) {
      return left(const Failure.unexpected());
    }
  }

  Future<Either<Failure, void>> writeData({
    required List<BookModel> books,
  }) async {
    try {
      realm.write(
        () => realm.addAll<BookRealm>(
          books.map((e) => e.toRealmObject()).toList(),
        ),
      );
      return right(null);
    } catch (e) {
      return left(const Failure.unexpected());
    }
  }

  Future<Either<Failure, List<BookModel>>> getData() async {
    try {
      final booksRealm = realm.all<BookRealm>();
      return right(booksRealm.map((e) => BookModel.fromRealm(e)).toList());
    } catch (e) {
      return left(const Failure.unexpected());
    }
  }
}

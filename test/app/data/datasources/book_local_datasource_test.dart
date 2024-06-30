import 'package:gutenberg_tome/app/data/datasources/book_local_data_source.dart';
import 'package:gutenberg_tome/app/data/model/book_model.dart';
import 'package:gutenberg_tome/core/realm/realm_model.dart';
import 'package:realm/realm.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late Realm realm;
  late BookLocalDataSource dataSource;

  setUpAll(() {
    realm = Realm(Configuration.inMemory([BookFavoriteRealm.schema]));
    dataSource = BookLocalDataSource(realm);
  });

  test('Should return empty list', () async {
    final result = await dataSource.getData();

    result.fold(
      (l) {},
      (r) {
        expect(r.length, 0);
      },
    );
  });

  test('Should return null after add to favorite', () async {
    final result = await dataSource.writeData(books: [
      BookModel(id: 1),
      BookModel(id: 2),
    ]);

    expect(result, isA<void>());
  });

  test('Should return 2 favorite book', () async {
    final result = await dataSource.getData();

    result.fold(
      (l) {},
      (r) {
        expect(r.length, 2);
      },
    );
  });

  tearDown(() {
    realm.close();
    Realm.shutdown();
  });
}

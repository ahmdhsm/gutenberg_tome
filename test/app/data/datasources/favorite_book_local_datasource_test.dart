import 'package:gutenberg_tome/app/data/datasources/favorite_book_local_data_source.dart';
import 'package:gutenberg_tome/app/data/model/book_model.dart';
import 'package:gutenberg_tome/core/realm/realm_model.dart';
import 'package:realm/realm.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late Realm realm;
  late FavoriteBookLocalDataSource dataSource;

  setUpAll(() {
    realm = Realm(Configuration.inMemory([BookFavoriteRealm.schema]));
    dataSource = FavoriteBookLocalDataSource(realm);
  });

  test('Should return empty list', () async {
    final result = await dataSource.getFavorite();

    result.fold(
      (l) {},
      (r) {
        expect(r.length, 0);
      },
    );
  });

  test('Should return null after add to favorite', () async {
    final result = await dataSource.addFavorite(book: BookModel(id: 123));

    expect(result, isA<void>());
  });

  test('Should return null after add to favorite', () async {
    final result = await dataSource.addFavorite(book: BookModel(id: 234));

    expect(result, isA<void>());
  });

  test('Should return 2 favorite book', () async {
    final result = await dataSource.getFavorite();

    result.fold(
      (l) {},
      (r) {
        expect(r.length, 2);
      },
    );
  });

  test('Will not insert new data if adding existing favorit book', () async {
    final result = await dataSource.addFavorite(book: BookModel(id: 234));

    expect(result, isA<void>());

    final checkLenght = await dataSource.getFavorite();

    checkLenght.fold(
      (l) {},
      (r) {
        expect(r.length, 2);
      },
    );
  });

  test('Will return void after remove item from favorite', () async {
    final result = await dataSource.removeFavorite(id: 234);

    expect(result, isA<void>());

    final checkLenght = await dataSource.getFavorite();

    checkLenght.fold(
      (l) {},
      (r) {
        expect(r.length, 1);
      },
    );
  });

  test('Detele non existing favorite book', () async {
    final result = await dataSource.removeFavorite(id: 234567);

    expect(result, isA<void>());

    final checkLenght = await dataSource.getFavorite();

    checkLenght.fold(
      (l) {},
      (r) {
        expect(r.length, 1);
      },
    );
  });

  tearDown(() {
    realm.close();
    Realm.shutdown();
  });
}

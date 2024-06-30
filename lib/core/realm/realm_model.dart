import 'package:realm/realm.dart';

part 'realm_model.realm.dart';

@RealmModel()
class _BookRealm {
  @PrimaryKey()
  late int id;
  late String title;
  late String authors;
  late String translators;
  late String subjects;
  late String bookshelves;
  late String languages;
  late bool copyright;
  late String mediaType;
  late String formats;
  late int downloadCount;
}

@RealmModel()
class _BookFavoriteRealm {
  @PrimaryKey()
  late int id;
  late String title;
  late String authors;
  late String translators;
  late String subjects;
  late String bookshelves;
  late String languages;
  late bool copyright;
  late String mediaType;
  late String formats;
  late int downloadCount;
}

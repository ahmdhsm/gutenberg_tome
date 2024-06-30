import 'package:dio/dio.dart';
import 'package:gutenberg_tome/core/realm/realm_model.dart';
import 'package:injectable/injectable.dart';
import 'package:realm/realm.dart';

@module
abstract class RegisterModule {
  Dio get dio => Dio();
  Realm get realm => Realm(
        Configuration.local(
          [BookRealm.schema, BookFavoriteRealm.schema],
        ),
      );
}

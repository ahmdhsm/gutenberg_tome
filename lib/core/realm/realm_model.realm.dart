// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'realm_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class BookRealm extends _BookRealm
    with RealmEntity, RealmObjectBase, RealmObject {
  BookRealm(
    int id,
    String title,
    String authors,
    String translators,
    String subjects,
    String bookshelves,
    String languages,
    bool copyright,
    String mediaType,
    String formats,
    int downloadCount,
  ) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'title', title);
    RealmObjectBase.set(this, 'authors', authors);
    RealmObjectBase.set(this, 'translators', translators);
    RealmObjectBase.set(this, 'subjects', subjects);
    RealmObjectBase.set(this, 'bookshelves', bookshelves);
    RealmObjectBase.set(this, 'languages', languages);
    RealmObjectBase.set(this, 'copyright', copyright);
    RealmObjectBase.set(this, 'mediaType', mediaType);
    RealmObjectBase.set(this, 'formats', formats);
    RealmObjectBase.set(this, 'downloadCount', downloadCount);
  }

  BookRealm._();

  @override
  int get id => RealmObjectBase.get<int>(this, 'id') as int;
  @override
  set id(int value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get title => RealmObjectBase.get<String>(this, 'title') as String;
  @override
  set title(String value) => RealmObjectBase.set(this, 'title', value);

  @override
  String get authors => RealmObjectBase.get<String>(this, 'authors') as String;
  @override
  set authors(String value) => RealmObjectBase.set(this, 'authors', value);

  @override
  String get translators =>
      RealmObjectBase.get<String>(this, 'translators') as String;
  @override
  set translators(String value) =>
      RealmObjectBase.set(this, 'translators', value);

  @override
  String get subjects =>
      RealmObjectBase.get<String>(this, 'subjects') as String;
  @override
  set subjects(String value) => RealmObjectBase.set(this, 'subjects', value);

  @override
  String get bookshelves =>
      RealmObjectBase.get<String>(this, 'bookshelves') as String;
  @override
  set bookshelves(String value) =>
      RealmObjectBase.set(this, 'bookshelves', value);

  @override
  String get languages =>
      RealmObjectBase.get<String>(this, 'languages') as String;
  @override
  set languages(String value) => RealmObjectBase.set(this, 'languages', value);

  @override
  bool get copyright => RealmObjectBase.get<bool>(this, 'copyright') as bool;
  @override
  set copyright(bool value) => RealmObjectBase.set(this, 'copyright', value);

  @override
  String get mediaType =>
      RealmObjectBase.get<String>(this, 'mediaType') as String;
  @override
  set mediaType(String value) => RealmObjectBase.set(this, 'mediaType', value);

  @override
  String get formats => RealmObjectBase.get<String>(this, 'formats') as String;
  @override
  set formats(String value) => RealmObjectBase.set(this, 'formats', value);

  @override
  int get downloadCount =>
      RealmObjectBase.get<int>(this, 'downloadCount') as int;
  @override
  set downloadCount(int value) =>
      RealmObjectBase.set(this, 'downloadCount', value);

  @override
  Stream<RealmObjectChanges<BookRealm>> get changes =>
      RealmObjectBase.getChanges<BookRealm>(this);

  @override
  Stream<RealmObjectChanges<BookRealm>> changesFor([List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<BookRealm>(this, keyPaths);

  @override
  BookRealm freeze() => RealmObjectBase.freezeObject<BookRealm>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'id': id.toEJson(),
      'title': title.toEJson(),
      'authors': authors.toEJson(),
      'translators': translators.toEJson(),
      'subjects': subjects.toEJson(),
      'bookshelves': bookshelves.toEJson(),
      'languages': languages.toEJson(),
      'copyright': copyright.toEJson(),
      'mediaType': mediaType.toEJson(),
      'formats': formats.toEJson(),
      'downloadCount': downloadCount.toEJson(),
    };
  }

  static EJsonValue _toEJson(BookRealm value) => value.toEJson();
  static BookRealm _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        'id': EJsonValue id,
        'title': EJsonValue title,
        'authors': EJsonValue authors,
        'translators': EJsonValue translators,
        'subjects': EJsonValue subjects,
        'bookshelves': EJsonValue bookshelves,
        'languages': EJsonValue languages,
        'copyright': EJsonValue copyright,
        'mediaType': EJsonValue mediaType,
        'formats': EJsonValue formats,
        'downloadCount': EJsonValue downloadCount,
      } =>
        BookRealm(
          fromEJson(id),
          fromEJson(title),
          fromEJson(authors),
          fromEJson(translators),
          fromEJson(subjects),
          fromEJson(bookshelves),
          fromEJson(languages),
          fromEJson(copyright),
          fromEJson(mediaType),
          fromEJson(formats),
          fromEJson(downloadCount),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(BookRealm._);
    register(_toEJson, _fromEJson);
    return SchemaObject(ObjectType.realmObject, BookRealm, 'BookRealm', [
      SchemaProperty('id', RealmPropertyType.int, primaryKey: true),
      SchemaProperty('title', RealmPropertyType.string),
      SchemaProperty('authors', RealmPropertyType.string),
      SchemaProperty('translators', RealmPropertyType.string),
      SchemaProperty('subjects', RealmPropertyType.string),
      SchemaProperty('bookshelves', RealmPropertyType.string),
      SchemaProperty('languages', RealmPropertyType.string),
      SchemaProperty('copyright', RealmPropertyType.bool),
      SchemaProperty('mediaType', RealmPropertyType.string),
      SchemaProperty('formats', RealmPropertyType.string),
      SchemaProperty('downloadCount', RealmPropertyType.int),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}

class BookFavoriteRealm extends _BookFavoriteRealm
    with RealmEntity, RealmObjectBase, RealmObject {
  BookFavoriteRealm(
    int id,
    String title,
    String authors,
    String translators,
    String subjects,
    String bookshelves,
    String languages,
    bool copyright,
    String mediaType,
    String formats,
    int downloadCount,
  ) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'title', title);
    RealmObjectBase.set(this, 'authors', authors);
    RealmObjectBase.set(this, 'translators', translators);
    RealmObjectBase.set(this, 'subjects', subjects);
    RealmObjectBase.set(this, 'bookshelves', bookshelves);
    RealmObjectBase.set(this, 'languages', languages);
    RealmObjectBase.set(this, 'copyright', copyright);
    RealmObjectBase.set(this, 'mediaType', mediaType);
    RealmObjectBase.set(this, 'formats', formats);
    RealmObjectBase.set(this, 'downloadCount', downloadCount);
  }

  BookFavoriteRealm._();

  @override
  int get id => RealmObjectBase.get<int>(this, 'id') as int;
  @override
  set id(int value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get title => RealmObjectBase.get<String>(this, 'title') as String;
  @override
  set title(String value) => RealmObjectBase.set(this, 'title', value);

  @override
  String get authors => RealmObjectBase.get<String>(this, 'authors') as String;
  @override
  set authors(String value) => RealmObjectBase.set(this, 'authors', value);

  @override
  String get translators =>
      RealmObjectBase.get<String>(this, 'translators') as String;
  @override
  set translators(String value) =>
      RealmObjectBase.set(this, 'translators', value);

  @override
  String get subjects =>
      RealmObjectBase.get<String>(this, 'subjects') as String;
  @override
  set subjects(String value) => RealmObjectBase.set(this, 'subjects', value);

  @override
  String get bookshelves =>
      RealmObjectBase.get<String>(this, 'bookshelves') as String;
  @override
  set bookshelves(String value) =>
      RealmObjectBase.set(this, 'bookshelves', value);

  @override
  String get languages =>
      RealmObjectBase.get<String>(this, 'languages') as String;
  @override
  set languages(String value) => RealmObjectBase.set(this, 'languages', value);

  @override
  bool get copyright => RealmObjectBase.get<bool>(this, 'copyright') as bool;
  @override
  set copyright(bool value) => RealmObjectBase.set(this, 'copyright', value);

  @override
  String get mediaType =>
      RealmObjectBase.get<String>(this, 'mediaType') as String;
  @override
  set mediaType(String value) => RealmObjectBase.set(this, 'mediaType', value);

  @override
  String get formats => RealmObjectBase.get<String>(this, 'formats') as String;
  @override
  set formats(String value) => RealmObjectBase.set(this, 'formats', value);

  @override
  int get downloadCount =>
      RealmObjectBase.get<int>(this, 'downloadCount') as int;
  @override
  set downloadCount(int value) =>
      RealmObjectBase.set(this, 'downloadCount', value);

  @override
  Stream<RealmObjectChanges<BookFavoriteRealm>> get changes =>
      RealmObjectBase.getChanges<BookFavoriteRealm>(this);

  @override
  Stream<RealmObjectChanges<BookFavoriteRealm>> changesFor(
          [List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<BookFavoriteRealm>(this, keyPaths);

  @override
  BookFavoriteRealm freeze() =>
      RealmObjectBase.freezeObject<BookFavoriteRealm>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'id': id.toEJson(),
      'title': title.toEJson(),
      'authors': authors.toEJson(),
      'translators': translators.toEJson(),
      'subjects': subjects.toEJson(),
      'bookshelves': bookshelves.toEJson(),
      'languages': languages.toEJson(),
      'copyright': copyright.toEJson(),
      'mediaType': mediaType.toEJson(),
      'formats': formats.toEJson(),
      'downloadCount': downloadCount.toEJson(),
    };
  }

  static EJsonValue _toEJson(BookFavoriteRealm value) => value.toEJson();
  static BookFavoriteRealm _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        'id': EJsonValue id,
        'title': EJsonValue title,
        'authors': EJsonValue authors,
        'translators': EJsonValue translators,
        'subjects': EJsonValue subjects,
        'bookshelves': EJsonValue bookshelves,
        'languages': EJsonValue languages,
        'copyright': EJsonValue copyright,
        'mediaType': EJsonValue mediaType,
        'formats': EJsonValue formats,
        'downloadCount': EJsonValue downloadCount,
      } =>
        BookFavoriteRealm(
          fromEJson(id),
          fromEJson(title),
          fromEJson(authors),
          fromEJson(translators),
          fromEJson(subjects),
          fromEJson(bookshelves),
          fromEJson(languages),
          fromEJson(copyright),
          fromEJson(mediaType),
          fromEJson(formats),
          fromEJson(downloadCount),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(BookFavoriteRealm._);
    register(_toEJson, _fromEJson);
    return SchemaObject(
        ObjectType.realmObject, BookFavoriteRealm, 'BookFavoriteRealm', [
      SchemaProperty('id', RealmPropertyType.int, primaryKey: true),
      SchemaProperty('title', RealmPropertyType.string),
      SchemaProperty('authors', RealmPropertyType.string),
      SchemaProperty('translators', RealmPropertyType.string),
      SchemaProperty('subjects', RealmPropertyType.string),
      SchemaProperty('bookshelves', RealmPropertyType.string),
      SchemaProperty('languages', RealmPropertyType.string),
      SchemaProperty('copyright', RealmPropertyType.bool),
      SchemaProperty('mediaType', RealmPropertyType.string),
      SchemaProperty('formats', RealmPropertyType.string),
      SchemaProperty('downloadCount', RealmPropertyType.int),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}

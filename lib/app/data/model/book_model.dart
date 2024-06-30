import 'dart:convert';

import 'package:gutenberg_tome/app/data/model/person_model.dart';
import 'package:gutenberg_tome/app/domain/entities/book_entity.dart';
import 'package:gutenberg_tome/core/realm/realm_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'book_model.g.dart';

@JsonSerializable()
class BookModel {
  BookModel({
    this.id,
    this.title,
    this.authors,
    this.translators,
    this.subjects,
    this.bookshelves,
    this.languages,
    this.copyright,
    this.mediaType,
    this.formats,
    this.downloadCount,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return _$BookModelFromJson(json);
  }

  final int? id;
  final String? title;
  final List<PersonModel>? authors;
  final List<PersonModel>? translators;
  final List<String>? subjects;
  final List<String>? bookshelves;
  final List<String>? languages;
  final bool? copyright;
  final String? mediaType;
  final Map<String, dynamic>? formats;
  final int? downloadCount;

  BookEntity mapToEntity() {
    return BookEntity(
      id: id ?? 0,
      title: title ?? '',
      authors: authors?.map((e) => e.mapToEntity()).toList() ?? [],
      translators: translators?.map((e) => e.mapToEntity()).toList() ?? [],
      subjects: subjects ?? [],
      bookshelves: bookshelves ?? [],
      languages: languages ?? [],
      copyright: copyright ?? false,
      mediaType: mediaType ?? '',
      formats: formats ?? {},
      downloadCount: downloadCount ?? 0,
    );
  }

  factory BookModel.fromEntity(BookEntity book) {
    return BookModel(
      id: book.id,
      title: book.title,
      authors: book.authors.map((e) => PersonModel.fromEntity(e)).toList(),
      translators:
          book.translators.map((e) => PersonModel.fromEntity(e)).toList(),
      subjects: book.subjects,
      bookshelves: book.bookshelves,
      languages: book.languages,
      copyright: book.copyright,
      mediaType: book.mediaType,
      formats: book.formats,
      downloadCount: book.downloadCount,
    );
  }

  BookRealm toRealmObject() {
    return BookRealm(
      id ?? 0,
      title ?? '',
      jsonEncode(authors ?? []),
      jsonEncode(translators ?? []),
      jsonEncode(subjects ?? []),
      jsonEncode(bookshelves ?? []),
      jsonEncode(languages ?? []),
      copyright ?? false,
      jsonEncode(mediaType ?? ''),
      jsonEncode(formats ?? {}),
      downloadCount ?? 0,
    );
  }

  BookFavoriteRealm toFavoriteRealmObject() {
    return BookFavoriteRealm(
      id ?? 0,
      title ?? '',
      jsonEncode(authors ?? []),
      jsonEncode(translators ?? []),
      jsonEncode(subjects ?? []),
      jsonEncode(bookshelves ?? []),
      jsonEncode(languages ?? []),
      copyright ?? false,
      jsonEncode(mediaType ?? ''),
      jsonEncode(formats ?? {}),
      downloadCount ?? 0,
    );
  }

  factory BookModel.fromRealm(BookRealm book) {
    return BookModel(
      id: book.id,
      title: book.title,
      authors: (jsonDecode(book.authors) as List<dynamic>)
          .map((e) => PersonModel.fromJson(e))
          .toList(),
      translators: (jsonDecode(book.translators) as List<dynamic>)
          .map((e) => PersonModel.fromJson(e))
          .toList(),
      subjects: (jsonDecode(book.subjects) as List<dynamic>)
          .map((e) => e.toString())
          .toList(),
      bookshelves: (jsonDecode(book.bookshelves) as List<dynamic>)
          .map((e) => e.toString())
          .toList(),
      languages: (jsonDecode(book.languages) as List<dynamic>)
          .map((e) => e.toString())
          .toList(),
      copyright: book.copyright,
      mediaType: book.mediaType,
      formats: jsonDecode(book.formats),
      downloadCount: book.downloadCount,
    );
  }

  factory BookModel.fromRealmFavorite(BookFavoriteRealm book) {
    return BookModel(
      id: book.id,
      title: book.title,
      authors: (jsonDecode(book.authors) as List<dynamic>)
          .map((e) => PersonModel.fromJson(e))
          .toList(),
      translators: (jsonDecode(book.translators) as List<dynamic>)
          .map((e) => PersonModel.fromJson(e))
          .toList(),
      subjects: (jsonDecode(book.subjects) as List<dynamic>)
          .map((e) => e.toString())
          .toList(),
      bookshelves: (jsonDecode(book.bookshelves) as List<dynamic>)
          .map((e) => e.toString())
          .toList(),
      languages: (jsonDecode(book.languages) as List<dynamic>)
          .map((e) => e.toString())
          .toList(),
      copyright: book.copyright,
      mediaType: book.mediaType,
      formats: jsonDecode(book.formats),
      downloadCount: book.downloadCount,
    );
  }
}

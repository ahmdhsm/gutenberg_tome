import 'package:gutenberg_tome/app/domain/entities/person_entity.dart';

class BookEntity {
  BookEntity({
    required this.id,
    required this.title,
    required this.authors,
    required this.translators,
    required this.subjects,
    required this.bookshelves,
    required this.languages,
    required this.copyright,
    required this.mediaType,
    required this.formats,
    required this.downloadCount,
  });

  final int id;
  final String title;
  final List<PersonEntity> authors;
  final List<PersonEntity> translators;
  final List<String> subjects;
  final List<String> bookshelves;
  final List<String> languages;
  final bool copyright;
  final String mediaType;
  final Map<String, dynamic> formats;
  final int downloadCount;

  String get authorsLabel {
    final authorArray = authors.map((author) => author.name).toList();
    return authorArray.join('; ');
  }

  String get languagesLabel => languages.join(', ');

  String? get imageUrl {
    if (formats.containsKey('image/jpeg')) {
      return formats['image/jpeg'];
    }
    return null;
  }
}

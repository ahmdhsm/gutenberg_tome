import 'package:gutenberg_tome/app/domain/entities/book_entity.dart';

class ApiResponseEntity {
  ApiResponseEntity({
    required this.count,
    required this.results,
    this.next,
    this.previous,
  });

  final int count;
  final String? next;
  final String? previous;
  final List<BookEntity> results;
}

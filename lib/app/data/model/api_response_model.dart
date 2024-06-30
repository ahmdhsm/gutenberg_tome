import 'package:gutenberg_tome/app/data/model/book_model.dart';
import 'package:gutenberg_tome/app/domain/entities/api_response_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_response_model.g.dart';

@JsonSerializable()
class ApiResponseModel {
  ApiResponseModel({
    this.count,
    this.results,
    this.next,
    this.previous,
  });

  final int? count;
  final String? next;
  final String? previous;
  final List<BookModel>? results;

  factory ApiResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseModelFromJson(json);

  ApiResponseEntity mapToEntity() {
    return ApiResponseEntity(
      count: count ?? 0,
      results: results?.map((e) => e.mapToEntity()).toList() ?? [],
      next: next,
      previous: previous,
    );
  }
}

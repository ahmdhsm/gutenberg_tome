import 'package:gutenberg_tome/app/domain/entities/person_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'person_model.g.dart';

@JsonSerializable()
class PersonModel {
  PersonModel({
    this.name,
    this.birthYear,
    this.deathYear,
  });

  final String? name;
  final int? birthYear;
  final int? deathYear;

  factory PersonModel.fromJson(Map<String, dynamic> json) =>
      _$PersonModelFromJson(json);

  Map<String, dynamic> toJson() => _$PersonModelToJson(this);

  PersonEntity mapToEntity() {
    return PersonEntity(
      name: name ?? '',
      birthYear: birthYear ?? 0,
      deathYear: deathYear ?? 0,
    );
  }

  factory PersonModel.fromEntity(PersonEntity person) {
    return PersonModel(
      name: person.name,
      birthYear: person.birthYear,
      deathYear: person.deathYear,
    );
  }
}

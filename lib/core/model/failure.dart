import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
class Failure with _$Failure {
  const factory Failure.unexpected({String? message}) = _Unexpected;
  const factory Failure.data({String? message}) = _Data;
  const factory Failure.dio({int? code, String? message}) = _Dio;
  const factory Failure.connection({String? message}) = _Connection;
}

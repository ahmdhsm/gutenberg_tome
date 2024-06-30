// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_list_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BookListState {
  List<BookEntity> get results => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isInitial => throw _privateConstructorUsedError;
  bool get isOffline => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  String? get previous => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BookListStateCopyWith<BookListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookListStateCopyWith<$Res> {
  factory $BookListStateCopyWith(
          BookListState value, $Res Function(BookListState) then) =
      _$BookListStateCopyWithImpl<$Res, BookListState>;
  @useResult
  $Res call(
      {List<BookEntity> results,
      bool isLoading,
      bool isInitial,
      bool isOffline,
      String? next,
      String? previous});
}

/// @nodoc
class _$BookListStateCopyWithImpl<$Res, $Val extends BookListState>
    implements $BookListStateCopyWith<$Res> {
  _$BookListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = null,
    Object? isLoading = null,
    Object? isInitial = null,
    Object? isOffline = null,
    Object? next = freezed,
    Object? previous = freezed,
  }) {
    return _then(_value.copyWith(
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<BookEntity>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isInitial: null == isInitial
          ? _value.isInitial
          : isInitial // ignore: cast_nullable_to_non_nullable
              as bool,
      isOffline: null == isOffline
          ? _value.isOffline
          : isOffline // ignore: cast_nullable_to_non_nullable
              as bool,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      previous: freezed == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookListStateImplCopyWith<$Res>
    implements $BookListStateCopyWith<$Res> {
  factory _$$BookListStateImplCopyWith(
          _$BookListStateImpl value, $Res Function(_$BookListStateImpl) then) =
      __$$BookListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<BookEntity> results,
      bool isLoading,
      bool isInitial,
      bool isOffline,
      String? next,
      String? previous});
}

/// @nodoc
class __$$BookListStateImplCopyWithImpl<$Res>
    extends _$BookListStateCopyWithImpl<$Res, _$BookListStateImpl>
    implements _$$BookListStateImplCopyWith<$Res> {
  __$$BookListStateImplCopyWithImpl(
      _$BookListStateImpl _value, $Res Function(_$BookListStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = null,
    Object? isLoading = null,
    Object? isInitial = null,
    Object? isOffline = null,
    Object? next = freezed,
    Object? previous = freezed,
  }) {
    return _then(_$BookListStateImpl(
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<BookEntity>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isInitial: null == isInitial
          ? _value.isInitial
          : isInitial // ignore: cast_nullable_to_non_nullable
              as bool,
      isOffline: null == isOffline
          ? _value.isOffline
          : isOffline // ignore: cast_nullable_to_non_nullable
              as bool,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      previous: freezed == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$BookListStateImpl implements _BookListState {
  const _$BookListStateImpl(
      {required final List<BookEntity> results,
      required this.isLoading,
      required this.isInitial,
      required this.isOffline,
      this.next,
      this.previous})
      : _results = results;

  final List<BookEntity> _results;
  @override
  List<BookEntity> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  final bool isLoading;
  @override
  final bool isInitial;
  @override
  final bool isOffline;
  @override
  final String? next;
  @override
  final String? previous;

  @override
  String toString() {
    return 'BookListState(results: $results, isLoading: $isLoading, isInitial: $isInitial, isOffline: $isOffline, next: $next, previous: $previous)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookListStateImpl &&
            const DeepCollectionEquality().equals(other._results, _results) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isInitial, isInitial) ||
                other.isInitial == isInitial) &&
            (identical(other.isOffline, isOffline) ||
                other.isOffline == isOffline) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.previous, previous) ||
                other.previous == previous));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_results),
      isLoading,
      isInitial,
      isOffline,
      next,
      previous);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookListStateImplCopyWith<_$BookListStateImpl> get copyWith =>
      __$$BookListStateImplCopyWithImpl<_$BookListStateImpl>(this, _$identity);
}

abstract class _BookListState implements BookListState {
  const factory _BookListState(
      {required final List<BookEntity> results,
      required final bool isLoading,
      required final bool isInitial,
      required final bool isOffline,
      final String? next,
      final String? previous}) = _$BookListStateImpl;

  @override
  List<BookEntity> get results;
  @override
  bool get isLoading;
  @override
  bool get isInitial;
  @override
  bool get isOffline;
  @override
  String? get next;
  @override
  String? get previous;
  @override
  @JsonKey(ignore: true)
  _$$BookListStateImplCopyWith<_$BookListStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

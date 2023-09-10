// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'search_emp_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SearchEmpModel _$SearchEmpModelFromJson(Map<String, dynamic> json) {
  return _SearchEmpModel.fromJson(json);
}

/// @nodoc
mixin _$SearchEmpModel {
  int? get status => throw _privateConstructorUsedError;
  List<DirectSpv>? get data => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchEmpModelCopyWith<SearchEmpModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchEmpModelCopyWith<$Res> {
  factory $SearchEmpModelCopyWith(
          SearchEmpModel value, $Res Function(SearchEmpModel) then) =
      _$SearchEmpModelCopyWithImpl<$Res, SearchEmpModel>;
  @useResult
  $Res call({int? status, List<DirectSpv>? data, String? message});
}

/// @nodoc
class _$SearchEmpModelCopyWithImpl<$Res, $Val extends SearchEmpModel>
    implements $SearchEmpModelCopyWith<$Res> {
  _$SearchEmpModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? data = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<DirectSpv>?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SearchEmpModelCopyWith<$Res>
    implements $SearchEmpModelCopyWith<$Res> {
  factory _$$_SearchEmpModelCopyWith(
          _$_SearchEmpModel value, $Res Function(_$_SearchEmpModel) then) =
      __$$_SearchEmpModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? status, List<DirectSpv>? data, String? message});
}

/// @nodoc
class __$$_SearchEmpModelCopyWithImpl<$Res>
    extends _$SearchEmpModelCopyWithImpl<$Res, _$_SearchEmpModel>
    implements _$$_SearchEmpModelCopyWith<$Res> {
  __$$_SearchEmpModelCopyWithImpl(
      _$_SearchEmpModel _value, $Res Function(_$_SearchEmpModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? data = freezed,
    Object? message = freezed,
  }) {
    return _then(_$_SearchEmpModel(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<DirectSpv>?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SearchEmpModel implements _SearchEmpModel {
  const _$_SearchEmpModel(
      {this.status, final List<DirectSpv>? data, this.message})
      : _data = data;

  factory _$_SearchEmpModel.fromJson(Map<String, dynamic> json) =>
      _$$_SearchEmpModelFromJson(json);

  @override
  final int? status;
  final List<DirectSpv>? _data;
  @override
  List<DirectSpv>? get data {
    final value = _data;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? message;

  @override
  String toString() {
    return 'SearchEmpModel(status: $status, data: $data, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchEmpModel &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(_data), message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchEmpModelCopyWith<_$_SearchEmpModel> get copyWith =>
      __$$_SearchEmpModelCopyWithImpl<_$_SearchEmpModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SearchEmpModelToJson(
      this,
    );
  }
}

abstract class _SearchEmpModel implements SearchEmpModel {
  const factory _SearchEmpModel(
      {final int? status,
      final List<DirectSpv>? data,
      final String? message}) = _$_SearchEmpModel;

  factory _SearchEmpModel.fromJson(Map<String, dynamic> json) =
      _$_SearchEmpModel.fromJson;

  @override
  int? get status;
  @override
  List<DirectSpv>? get data;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$_SearchEmpModelCopyWith<_$_SearchEmpModel> get copyWith =>
      throw _privateConstructorUsedError;
}

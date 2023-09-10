// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'visitor_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VisitorModel _$VisitorModelFromJson(Map<String, dynamic> json) {
  return _VisitorModel.fromJson(json);
}

/// @nodoc
mixin _$VisitorModel {
  int? get status => throw _privateConstructorUsedError;
  VisitorTotal? get data => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VisitorModelCopyWith<VisitorModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VisitorModelCopyWith<$Res> {
  factory $VisitorModelCopyWith(
          VisitorModel value, $Res Function(VisitorModel) then) =
      _$VisitorModelCopyWithImpl<$Res, VisitorModel>;
  @useResult
  $Res call({int? status, VisitorTotal? data, String? message});

  $VisitorTotalCopyWith<$Res>? get data;
}

/// @nodoc
class _$VisitorModelCopyWithImpl<$Res, $Val extends VisitorModel>
    implements $VisitorModelCopyWith<$Res> {
  _$VisitorModelCopyWithImpl(this._value, this._then);

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
              as VisitorTotal?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $VisitorTotalCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $VisitorTotalCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_VisitorModelCopyWith<$Res>
    implements $VisitorModelCopyWith<$Res> {
  factory _$$_VisitorModelCopyWith(
          _$_VisitorModel value, $Res Function(_$_VisitorModel) then) =
      __$$_VisitorModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? status, VisitorTotal? data, String? message});

  @override
  $VisitorTotalCopyWith<$Res>? get data;
}

/// @nodoc
class __$$_VisitorModelCopyWithImpl<$Res>
    extends _$VisitorModelCopyWithImpl<$Res, _$_VisitorModel>
    implements _$$_VisitorModelCopyWith<$Res> {
  __$$_VisitorModelCopyWithImpl(
      _$_VisitorModel _value, $Res Function(_$_VisitorModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? data = freezed,
    Object? message = freezed,
  }) {
    return _then(_$_VisitorModel(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as VisitorTotal?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_VisitorModel implements _VisitorModel {
  const _$_VisitorModel({this.status, this.data, this.message});

  factory _$_VisitorModel.fromJson(Map<String, dynamic> json) =>
      _$$_VisitorModelFromJson(json);

  @override
  final int? status;
  @override
  final VisitorTotal? data;
  @override
  final String? message;

  @override
  String toString() {
    return 'VisitorModel(status: $status, data: $data, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VisitorModel &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, data, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VisitorModelCopyWith<_$_VisitorModel> get copyWith =>
      __$$_VisitorModelCopyWithImpl<_$_VisitorModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VisitorModelToJson(
      this,
    );
  }
}

abstract class _VisitorModel implements VisitorModel {
  const factory _VisitorModel(
      {final int? status,
      final VisitorTotal? data,
      final String? message}) = _$_VisitorModel;

  factory _VisitorModel.fromJson(Map<String, dynamic> json) =
      _$_VisitorModel.fromJson;

  @override
  int? get status;
  @override
  VisitorTotal? get data;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$_VisitorModelCopyWith<_$_VisitorModel> get copyWith =>
      throw _privateConstructorUsedError;
}

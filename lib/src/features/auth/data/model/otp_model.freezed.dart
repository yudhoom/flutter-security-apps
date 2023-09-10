// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'otp_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OtpModel _$OtpModelFromJson(Map<String, dynamic> json) {
  return _OtpModel.fromJson(json);
}

/// @nodoc
mixin _$OtpModel {
  int? get status => throw _privateConstructorUsedError;
  Otp? get data => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OtpModelCopyWith<OtpModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtpModelCopyWith<$Res> {
  factory $OtpModelCopyWith(OtpModel value, $Res Function(OtpModel) then) =
      _$OtpModelCopyWithImpl<$Res, OtpModel>;
  @useResult
  $Res call({int? status, Otp? data, String? message});

  $OtpCopyWith<$Res>? get data;
}

/// @nodoc
class _$OtpModelCopyWithImpl<$Res, $Val extends OtpModel>
    implements $OtpModelCopyWith<$Res> {
  _$OtpModelCopyWithImpl(this._value, this._then);

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
              as Otp?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OtpCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $OtpCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_OtpModelCopyWith<$Res> implements $OtpModelCopyWith<$Res> {
  factory _$$_OtpModelCopyWith(
          _$_OtpModel value, $Res Function(_$_OtpModel) then) =
      __$$_OtpModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? status, Otp? data, String? message});

  @override
  $OtpCopyWith<$Res>? get data;
}

/// @nodoc
class __$$_OtpModelCopyWithImpl<$Res>
    extends _$OtpModelCopyWithImpl<$Res, _$_OtpModel>
    implements _$$_OtpModelCopyWith<$Res> {
  __$$_OtpModelCopyWithImpl(
      _$_OtpModel _value, $Res Function(_$_OtpModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? data = freezed,
    Object? message = freezed,
  }) {
    return _then(_$_OtpModel(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Otp?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OtpModel implements _OtpModel {
  const _$_OtpModel({this.status, this.data, this.message});

  factory _$_OtpModel.fromJson(Map<String, dynamic> json) =>
      _$$_OtpModelFromJson(json);

  @override
  final int? status;
  @override
  final Otp? data;
  @override
  final String? message;

  @override
  String toString() {
    return 'OtpModel(status: $status, data: $data, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OtpModel &&
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
  _$$_OtpModelCopyWith<_$_OtpModel> get copyWith =>
      __$$_OtpModelCopyWithImpl<_$_OtpModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OtpModelToJson(
      this,
    );
  }
}

abstract class _OtpModel implements OtpModel {
  const factory _OtpModel(
      {final int? status,
      final Otp? data,
      final String? message}) = _$_OtpModel;

  factory _OtpModel.fromJson(Map<String, dynamic> json) = _$_OtpModel.fromJson;

  @override
  int? get status;
  @override
  Otp? get data;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$_OtpModelCopyWith<_$_OtpModel> get copyWith =>
      throw _privateConstructorUsedError;
}

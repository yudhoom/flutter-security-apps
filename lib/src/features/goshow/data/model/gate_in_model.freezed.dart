// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'gate_in_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GateInModel _$GateInModelFromJson(Map<String, dynamic> json) {
  return _GateInModel.fromJson(json);
}

/// @nodoc
mixin _$GateInModel {
  int? get status => throw _privateConstructorUsedError;
  GateInKaryawanTamu? get data => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GateInModelCopyWith<GateInModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GateInModelCopyWith<$Res> {
  factory $GateInModelCopyWith(
          GateInModel value, $Res Function(GateInModel) then) =
      _$GateInModelCopyWithImpl<$Res, GateInModel>;
  @useResult
  $Res call({int? status, GateInKaryawanTamu? data, String? message});

  $GateInKaryawanTamuCopyWith<$Res>? get data;
}

/// @nodoc
class _$GateInModelCopyWithImpl<$Res, $Val extends GateInModel>
    implements $GateInModelCopyWith<$Res> {
  _$GateInModelCopyWithImpl(this._value, this._then);

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
              as GateInKaryawanTamu?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GateInKaryawanTamuCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $GateInKaryawanTamuCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_GateInModelCopyWith<$Res>
    implements $GateInModelCopyWith<$Res> {
  factory _$$_GateInModelCopyWith(
          _$_GateInModel value, $Res Function(_$_GateInModel) then) =
      __$$_GateInModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? status, GateInKaryawanTamu? data, String? message});

  @override
  $GateInKaryawanTamuCopyWith<$Res>? get data;
}

/// @nodoc
class __$$_GateInModelCopyWithImpl<$Res>
    extends _$GateInModelCopyWithImpl<$Res, _$_GateInModel>
    implements _$$_GateInModelCopyWith<$Res> {
  __$$_GateInModelCopyWithImpl(
      _$_GateInModel _value, $Res Function(_$_GateInModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? data = freezed,
    Object? message = freezed,
  }) {
    return _then(_$_GateInModel(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as GateInKaryawanTamu?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GateInModel implements _GateInModel {
  const _$_GateInModel({this.status, this.data, this.message});

  factory _$_GateInModel.fromJson(Map<String, dynamic> json) =>
      _$$_GateInModelFromJson(json);

  @override
  final int? status;
  @override
  final GateInKaryawanTamu? data;
  @override
  final String? message;

  @override
  String toString() {
    return 'GateInModel(status: $status, data: $data, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GateInModel &&
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
  _$$_GateInModelCopyWith<_$_GateInModel> get copyWith =>
      __$$_GateInModelCopyWithImpl<_$_GateInModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GateInModelToJson(
      this,
    );
  }
}

abstract class _GateInModel implements GateInModel {
  const factory _GateInModel(
      {final int? status,
      final GateInKaryawanTamu? data,
      final String? message}) = _$_GateInModel;

  factory _GateInModel.fromJson(Map<String, dynamic> json) =
      _$_GateInModel.fromJson;

  @override
  int? get status;
  @override
  GateInKaryawanTamu? get data;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$_GateInModelCopyWith<_$_GateInModel> get copyWith =>
      throw _privateConstructorUsedError;
}

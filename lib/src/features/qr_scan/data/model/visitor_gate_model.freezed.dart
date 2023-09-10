// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'visitor_gate_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VisitorGateModel _$VisitorGateModelFromJson(Map<String, dynamic> json) {
  return _VisitorGateModel.fromJson(json);
}

/// @nodoc
mixin _$VisitorGateModel {
  int? get status => throw _privateConstructorUsedError;
  VisitorGate? get data => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VisitorGateModelCopyWith<VisitorGateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VisitorGateModelCopyWith<$Res> {
  factory $VisitorGateModelCopyWith(
          VisitorGateModel value, $Res Function(VisitorGateModel) then) =
      _$VisitorGateModelCopyWithImpl<$Res, VisitorGateModel>;
  @useResult
  $Res call({int? status, VisitorGate? data, String? message});

  $VisitorGateCopyWith<$Res>? get data;
}

/// @nodoc
class _$VisitorGateModelCopyWithImpl<$Res, $Val extends VisitorGateModel>
    implements $VisitorGateModelCopyWith<$Res> {
  _$VisitorGateModelCopyWithImpl(this._value, this._then);

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
              as VisitorGate?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $VisitorGateCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $VisitorGateCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_VisitorGateModelCopyWith<$Res>
    implements $VisitorGateModelCopyWith<$Res> {
  factory _$$_VisitorGateModelCopyWith(
          _$_VisitorGateModel value, $Res Function(_$_VisitorGateModel) then) =
      __$$_VisitorGateModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? status, VisitorGate? data, String? message});

  @override
  $VisitorGateCopyWith<$Res>? get data;
}

/// @nodoc
class __$$_VisitorGateModelCopyWithImpl<$Res>
    extends _$VisitorGateModelCopyWithImpl<$Res, _$_VisitorGateModel>
    implements _$$_VisitorGateModelCopyWith<$Res> {
  __$$_VisitorGateModelCopyWithImpl(
      _$_VisitorGateModel _value, $Res Function(_$_VisitorGateModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? data = freezed,
    Object? message = freezed,
  }) {
    return _then(_$_VisitorGateModel(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as VisitorGate?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_VisitorGateModel implements _VisitorGateModel {
  const _$_VisitorGateModel({this.status, this.data, this.message});

  factory _$_VisitorGateModel.fromJson(Map<String, dynamic> json) =>
      _$$_VisitorGateModelFromJson(json);

  @override
  final int? status;
  @override
  final VisitorGate? data;
  @override
  final String? message;

  @override
  String toString() {
    return 'VisitorGateModel(status: $status, data: $data, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VisitorGateModel &&
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
  _$$_VisitorGateModelCopyWith<_$_VisitorGateModel> get copyWith =>
      __$$_VisitorGateModelCopyWithImpl<_$_VisitorGateModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VisitorGateModelToJson(
      this,
    );
  }
}

abstract class _VisitorGateModel implements VisitorGateModel {
  const factory _VisitorGateModel(
      {final int? status,
      final VisitorGate? data,
      final String? message}) = _$_VisitorGateModel;

  factory _VisitorGateModel.fromJson(Map<String, dynamic> json) =
      _$_VisitorGateModel.fromJson;

  @override
  int? get status;
  @override
  VisitorGate? get data;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$_VisitorGateModelCopyWith<_$_VisitorGateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

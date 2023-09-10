// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'visitor_gate_in_out_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VisitorGateInOutModel _$VisitorGateInOutModelFromJson(
    Map<String, dynamic> json) {
  return _VisitorGateInOutModel.fromJson(json);
}

/// @nodoc
mixin _$VisitorGateInOutModel {
  VisitorGateInOut? get data => throw _privateConstructorUsedError;
  int? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VisitorGateInOutModelCopyWith<VisitorGateInOutModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VisitorGateInOutModelCopyWith<$Res> {
  factory $VisitorGateInOutModelCopyWith(VisitorGateInOutModel value,
          $Res Function(VisitorGateInOutModel) then) =
      _$VisitorGateInOutModelCopyWithImpl<$Res, VisitorGateInOutModel>;
  @useResult
  $Res call({VisitorGateInOut? data, int? status, String? message});

  $VisitorGateInOutCopyWith<$Res>? get data;
}

/// @nodoc
class _$VisitorGateInOutModelCopyWithImpl<$Res,
        $Val extends VisitorGateInOutModel>
    implements $VisitorGateInOutModelCopyWith<$Res> {
  _$VisitorGateInOutModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? status = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as VisitorGateInOut?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $VisitorGateInOutCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $VisitorGateInOutCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_VisitorGateInOutModelCopyWith<$Res>
    implements $VisitorGateInOutModelCopyWith<$Res> {
  factory _$$_VisitorGateInOutModelCopyWith(_$_VisitorGateInOutModel value,
          $Res Function(_$_VisitorGateInOutModel) then) =
      __$$_VisitorGateInOutModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({VisitorGateInOut? data, int? status, String? message});

  @override
  $VisitorGateInOutCopyWith<$Res>? get data;
}

/// @nodoc
class __$$_VisitorGateInOutModelCopyWithImpl<$Res>
    extends _$VisitorGateInOutModelCopyWithImpl<$Res, _$_VisitorGateInOutModel>
    implements _$$_VisitorGateInOutModelCopyWith<$Res> {
  __$$_VisitorGateInOutModelCopyWithImpl(_$_VisitorGateInOutModel _value,
      $Res Function(_$_VisitorGateInOutModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? status = freezed,
    Object? message = freezed,
  }) {
    return _then(_$_VisitorGateInOutModel(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as VisitorGateInOut?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_VisitorGateInOutModel implements _VisitorGateInOutModel {
  const _$_VisitorGateInOutModel({this.data, this.status, this.message});

  factory _$_VisitorGateInOutModel.fromJson(Map<String, dynamic> json) =>
      _$$_VisitorGateInOutModelFromJson(json);

  @override
  final VisitorGateInOut? data;
  @override
  final int? status;
  @override
  final String? message;

  @override
  String toString() {
    return 'VisitorGateInOutModel(data: $data, status: $status, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VisitorGateInOutModel &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, data, status, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VisitorGateInOutModelCopyWith<_$_VisitorGateInOutModel> get copyWith =>
      __$$_VisitorGateInOutModelCopyWithImpl<_$_VisitorGateInOutModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VisitorGateInOutModelToJson(
      this,
    );
  }
}

abstract class _VisitorGateInOutModel implements VisitorGateInOutModel {
  const factory _VisitorGateInOutModel(
      {final VisitorGateInOut? data,
      final int? status,
      final String? message}) = _$_VisitorGateInOutModel;

  factory _VisitorGateInOutModel.fromJson(Map<String, dynamic> json) =
      _$_VisitorGateInOutModel.fromJson;

  @override
  VisitorGateInOut? get data;
  @override
  int? get status;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$_VisitorGateInOutModelCopyWith<_$_VisitorGateInOutModel> get copyWith =>
      throw _privateConstructorUsedError;
}

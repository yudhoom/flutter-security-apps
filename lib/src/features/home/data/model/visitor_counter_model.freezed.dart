// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'visitor_counter_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VisitorCounterModel _$VisitorCounterModelFromJson(Map<String, dynamic> json) {
  return _VisitorCounterModel.fromJson(json);
}

/// @nodoc
mixin _$VisitorCounterModel {
  int? get status => throw _privateConstructorUsedError;
  VisitorCounter? get data => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VisitorCounterModelCopyWith<VisitorCounterModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VisitorCounterModelCopyWith<$Res> {
  factory $VisitorCounterModelCopyWith(
          VisitorCounterModel value, $Res Function(VisitorCounterModel) then) =
      _$VisitorCounterModelCopyWithImpl<$Res, VisitorCounterModel>;
  @useResult
  $Res call({int? status, VisitorCounter? data, String? message});

  $VisitorCounterCopyWith<$Res>? get data;
}

/// @nodoc
class _$VisitorCounterModelCopyWithImpl<$Res, $Val extends VisitorCounterModel>
    implements $VisitorCounterModelCopyWith<$Res> {
  _$VisitorCounterModelCopyWithImpl(this._value, this._then);

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
              as VisitorCounter?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $VisitorCounterCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $VisitorCounterCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_VisitorCounterModelCopyWith<$Res>
    implements $VisitorCounterModelCopyWith<$Res> {
  factory _$$_VisitorCounterModelCopyWith(_$_VisitorCounterModel value,
          $Res Function(_$_VisitorCounterModel) then) =
      __$$_VisitorCounterModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? status, VisitorCounter? data, String? message});

  @override
  $VisitorCounterCopyWith<$Res>? get data;
}

/// @nodoc
class __$$_VisitorCounterModelCopyWithImpl<$Res>
    extends _$VisitorCounterModelCopyWithImpl<$Res, _$_VisitorCounterModel>
    implements _$$_VisitorCounterModelCopyWith<$Res> {
  __$$_VisitorCounterModelCopyWithImpl(_$_VisitorCounterModel _value,
      $Res Function(_$_VisitorCounterModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? data = freezed,
    Object? message = freezed,
  }) {
    return _then(_$_VisitorCounterModel(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as VisitorCounter?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_VisitorCounterModel implements _VisitorCounterModel {
  const _$_VisitorCounterModel({this.status, this.data, this.message});

  factory _$_VisitorCounterModel.fromJson(Map<String, dynamic> json) =>
      _$$_VisitorCounterModelFromJson(json);

  @override
  final int? status;
  @override
  final VisitorCounter? data;
  @override
  final String? message;

  @override
  String toString() {
    return 'VisitorCounterModel(status: $status, data: $data, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VisitorCounterModel &&
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
  _$$_VisitorCounterModelCopyWith<_$_VisitorCounterModel> get copyWith =>
      __$$_VisitorCounterModelCopyWithImpl<_$_VisitorCounterModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VisitorCounterModelToJson(
      this,
    );
  }
}

abstract class _VisitorCounterModel implements VisitorCounterModel {
  const factory _VisitorCounterModel(
      {final int? status,
      final VisitorCounter? data,
      final String? message}) = _$_VisitorCounterModel;

  factory _VisitorCounterModel.fromJson(Map<String, dynamic> json) =
      _$_VisitorCounterModel.fromJson;

  @override
  int? get status;
  @override
  VisitorCounter? get data;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$_VisitorCounterModelCopyWith<_$_VisitorCounterModel> get copyWith =>
      throw _privateConstructorUsedError;
}

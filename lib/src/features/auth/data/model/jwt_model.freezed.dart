// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'jwt_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

JwtModel _$JwtModelFromJson(Map<String, dynamic> json) {
  return _JwtModel.fromJson(json);
}

/// @nodoc
mixin _$JwtModel {
  int? get status => throw _privateConstructorUsedError;
  JwtDomain? get data => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JwtModelCopyWith<JwtModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JwtModelCopyWith<$Res> {
  factory $JwtModelCopyWith(JwtModel value, $Res Function(JwtModel) then) =
      _$JwtModelCopyWithImpl<$Res, JwtModel>;
  @useResult
  $Res call({int? status, JwtDomain? data, String? message});

  $JwtDomainCopyWith<$Res>? get data;
}

/// @nodoc
class _$JwtModelCopyWithImpl<$Res, $Val extends JwtModel>
    implements $JwtModelCopyWith<$Res> {
  _$JwtModelCopyWithImpl(this._value, this._then);

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
              as JwtDomain?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $JwtDomainCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $JwtDomainCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_JwtModelCopyWith<$Res> implements $JwtModelCopyWith<$Res> {
  factory _$$_JwtModelCopyWith(
          _$_JwtModel value, $Res Function(_$_JwtModel) then) =
      __$$_JwtModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? status, JwtDomain? data, String? message});

  @override
  $JwtDomainCopyWith<$Res>? get data;
}

/// @nodoc
class __$$_JwtModelCopyWithImpl<$Res>
    extends _$JwtModelCopyWithImpl<$Res, _$_JwtModel>
    implements _$$_JwtModelCopyWith<$Res> {
  __$$_JwtModelCopyWithImpl(
      _$_JwtModel _value, $Res Function(_$_JwtModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? data = freezed,
    Object? message = freezed,
  }) {
    return _then(_$_JwtModel(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as JwtDomain?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_JwtModel implements _JwtModel {
  const _$_JwtModel({this.status, this.data, this.message});

  factory _$_JwtModel.fromJson(Map<String, dynamic> json) =>
      _$$_JwtModelFromJson(json);

  @override
  final int? status;
  @override
  final JwtDomain? data;
  @override
  final String? message;

  @override
  String toString() {
    return 'JwtModel(status: $status, data: $data, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_JwtModel &&
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
  _$$_JwtModelCopyWith<_$_JwtModel> get copyWith =>
      __$$_JwtModelCopyWithImpl<_$_JwtModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_JwtModelToJson(
      this,
    );
  }
}

abstract class _JwtModel implements JwtModel {
  const factory _JwtModel(
      {final int? status,
      final JwtDomain? data,
      final String? message}) = _$_JwtModel;

  factory _JwtModel.fromJson(Map<String, dynamic> json) = _$_JwtModel.fromJson;

  @override
  int? get status;
  @override
  JwtDomain? get data;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$_JwtModelCopyWith<_$_JwtModel> get copyWith =>
      throw _privateConstructorUsedError;
}

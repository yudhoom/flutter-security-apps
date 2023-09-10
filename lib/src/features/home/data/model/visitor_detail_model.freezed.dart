// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'visitor_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VisitorDetailModel _$VisitorDetailModelFromJson(Map<String, dynamic> json) {
  return _VisitorDetailModel.fromJson(json);
}

/// @nodoc
mixin _$VisitorDetailModel {
  int? get status => throw _privateConstructorUsedError;
  VisitorDetail? get data => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VisitorDetailModelCopyWith<VisitorDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VisitorDetailModelCopyWith<$Res> {
  factory $VisitorDetailModelCopyWith(
          VisitorDetailModel value, $Res Function(VisitorDetailModel) then) =
      _$VisitorDetailModelCopyWithImpl<$Res, VisitorDetailModel>;
  @useResult
  $Res call({int? status, VisitorDetail? data, String? message});

  $VisitorDetailCopyWith<$Res>? get data;
}

/// @nodoc
class _$VisitorDetailModelCopyWithImpl<$Res, $Val extends VisitorDetailModel>
    implements $VisitorDetailModelCopyWith<$Res> {
  _$VisitorDetailModelCopyWithImpl(this._value, this._then);

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
              as VisitorDetail?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $VisitorDetailCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $VisitorDetailCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_VisitorDetailModelCopyWith<$Res>
    implements $VisitorDetailModelCopyWith<$Res> {
  factory _$$_VisitorDetailModelCopyWith(_$_VisitorDetailModel value,
          $Res Function(_$_VisitorDetailModel) then) =
      __$$_VisitorDetailModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? status, VisitorDetail? data, String? message});

  @override
  $VisitorDetailCopyWith<$Res>? get data;
}

/// @nodoc
class __$$_VisitorDetailModelCopyWithImpl<$Res>
    extends _$VisitorDetailModelCopyWithImpl<$Res, _$_VisitorDetailModel>
    implements _$$_VisitorDetailModelCopyWith<$Res> {
  __$$_VisitorDetailModelCopyWithImpl(
      _$_VisitorDetailModel _value, $Res Function(_$_VisitorDetailModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? data = freezed,
    Object? message = freezed,
  }) {
    return _then(_$_VisitorDetailModel(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as VisitorDetail?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_VisitorDetailModel implements _VisitorDetailModel {
  const _$_VisitorDetailModel({this.status, this.data, this.message});

  factory _$_VisitorDetailModel.fromJson(Map<String, dynamic> json) =>
      _$$_VisitorDetailModelFromJson(json);

  @override
  final int? status;
  @override
  final VisitorDetail? data;
  @override
  final String? message;

  @override
  String toString() {
    return 'VisitorDetailModel(status: $status, data: $data, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VisitorDetailModel &&
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
  _$$_VisitorDetailModelCopyWith<_$_VisitorDetailModel> get copyWith =>
      __$$_VisitorDetailModelCopyWithImpl<_$_VisitorDetailModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VisitorDetailModelToJson(
      this,
    );
  }
}

abstract class _VisitorDetailModel implements VisitorDetailModel {
  const factory _VisitorDetailModel(
      {final int? status,
      final VisitorDetail? data,
      final String? message}) = _$_VisitorDetailModel;

  factory _VisitorDetailModel.fromJson(Map<String, dynamic> json) =
      _$_VisitorDetailModel.fromJson;

  @override
  int? get status;
  @override
  VisitorDetail? get data;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$_VisitorDetailModelCopyWith<_$_VisitorDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

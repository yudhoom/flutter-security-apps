// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'image_tmp_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ImageTmpModel _$ImageTmpModelFromJson(Map<String, dynamic> json) {
  return _ImageTmpModel.fromJson(json);
}

/// @nodoc
mixin _$ImageTmpModel {
  int? get status => throw _privateConstructorUsedError;
  ImageTmp? get data => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImageTmpModelCopyWith<ImageTmpModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageTmpModelCopyWith<$Res> {
  factory $ImageTmpModelCopyWith(
          ImageTmpModel value, $Res Function(ImageTmpModel) then) =
      _$ImageTmpModelCopyWithImpl<$Res, ImageTmpModel>;
  @useResult
  $Res call({int? status, ImageTmp? data, String? message});

  $ImageTmpCopyWith<$Res>? get data;
}

/// @nodoc
class _$ImageTmpModelCopyWithImpl<$Res, $Val extends ImageTmpModel>
    implements $ImageTmpModelCopyWith<$Res> {
  _$ImageTmpModelCopyWithImpl(this._value, this._then);

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
              as ImageTmp?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ImageTmpCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $ImageTmpCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ImageTmpModelCopyWith<$Res>
    implements $ImageTmpModelCopyWith<$Res> {
  factory _$$_ImageTmpModelCopyWith(
          _$_ImageTmpModel value, $Res Function(_$_ImageTmpModel) then) =
      __$$_ImageTmpModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? status, ImageTmp? data, String? message});

  @override
  $ImageTmpCopyWith<$Res>? get data;
}

/// @nodoc
class __$$_ImageTmpModelCopyWithImpl<$Res>
    extends _$ImageTmpModelCopyWithImpl<$Res, _$_ImageTmpModel>
    implements _$$_ImageTmpModelCopyWith<$Res> {
  __$$_ImageTmpModelCopyWithImpl(
      _$_ImageTmpModel _value, $Res Function(_$_ImageTmpModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? data = freezed,
    Object? message = freezed,
  }) {
    return _then(_$_ImageTmpModel(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ImageTmp?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ImageTmpModel implements _ImageTmpModel {
  const _$_ImageTmpModel({this.status, this.data, this.message});

  factory _$_ImageTmpModel.fromJson(Map<String, dynamic> json) =>
      _$$_ImageTmpModelFromJson(json);

  @override
  final int? status;
  @override
  final ImageTmp? data;
  @override
  final String? message;

  @override
  String toString() {
    return 'ImageTmpModel(status: $status, data: $data, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ImageTmpModel &&
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
  _$$_ImageTmpModelCopyWith<_$_ImageTmpModel> get copyWith =>
      __$$_ImageTmpModelCopyWithImpl<_$_ImageTmpModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ImageTmpModelToJson(
      this,
    );
  }
}

abstract class _ImageTmpModel implements ImageTmpModel {
  const factory _ImageTmpModel(
      {final int? status,
      final ImageTmp? data,
      final String? message}) = _$_ImageTmpModel;

  factory _ImageTmpModel.fromJson(Map<String, dynamic> json) =
      _$_ImageTmpModel.fromJson;

  @override
  int? get status;
  @override
  ImageTmp? get data;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$_ImageTmpModelCopyWith<_$_ImageTmpModel> get copyWith =>
      throw _privateConstructorUsedError;
}

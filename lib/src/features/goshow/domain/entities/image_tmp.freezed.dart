// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'image_tmp.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ImageTmp _$ImageTmpFromJson(Map<String, dynamic> json) {
  return _ImageTmp.fromJson(json);
}

/// @nodoc
mixin _$ImageTmp {
  @JsonKey(name: 'image_profile_url')
  String? get imageProfileUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_location')
  String? get imageLocation => throw _privateConstructorUsedError;
  @JsonKey(name: 'mime_type')
  String? get mimeType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImageTmpCopyWith<ImageTmp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageTmpCopyWith<$Res> {
  factory $ImageTmpCopyWith(ImageTmp value, $Res Function(ImageTmp) then) =
      _$ImageTmpCopyWithImpl<$Res, ImageTmp>;
  @useResult
  $Res call(
      {@JsonKey(name: 'image_profile_url') String? imageProfileUrl,
      @JsonKey(name: 'image_location') String? imageLocation,
      @JsonKey(name: 'mime_type') String? mimeType});
}

/// @nodoc
class _$ImageTmpCopyWithImpl<$Res, $Val extends ImageTmp>
    implements $ImageTmpCopyWith<$Res> {
  _$ImageTmpCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageProfileUrl = freezed,
    Object? imageLocation = freezed,
    Object? mimeType = freezed,
  }) {
    return _then(_value.copyWith(
      imageProfileUrl: freezed == imageProfileUrl
          ? _value.imageProfileUrl
          : imageProfileUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      imageLocation: freezed == imageLocation
          ? _value.imageLocation
          : imageLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      mimeType: freezed == mimeType
          ? _value.mimeType
          : mimeType // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ImageTmpCopyWith<$Res> implements $ImageTmpCopyWith<$Res> {
  factory _$$_ImageTmpCopyWith(
          _$_ImageTmp value, $Res Function(_$_ImageTmp) then) =
      __$$_ImageTmpCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'image_profile_url') String? imageProfileUrl,
      @JsonKey(name: 'image_location') String? imageLocation,
      @JsonKey(name: 'mime_type') String? mimeType});
}

/// @nodoc
class __$$_ImageTmpCopyWithImpl<$Res>
    extends _$ImageTmpCopyWithImpl<$Res, _$_ImageTmp>
    implements _$$_ImageTmpCopyWith<$Res> {
  __$$_ImageTmpCopyWithImpl(
      _$_ImageTmp _value, $Res Function(_$_ImageTmp) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageProfileUrl = freezed,
    Object? imageLocation = freezed,
    Object? mimeType = freezed,
  }) {
    return _then(_$_ImageTmp(
      imageProfileUrl: freezed == imageProfileUrl
          ? _value.imageProfileUrl
          : imageProfileUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      imageLocation: freezed == imageLocation
          ? _value.imageLocation
          : imageLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      mimeType: freezed == mimeType
          ? _value.mimeType
          : mimeType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ImageTmp implements _ImageTmp {
  const _$_ImageTmp(
      {@JsonKey(name: 'image_profile_url') this.imageProfileUrl,
      @JsonKey(name: 'image_location') this.imageLocation,
      @JsonKey(name: 'mime_type') this.mimeType});

  factory _$_ImageTmp.fromJson(Map<String, dynamic> json) =>
      _$$_ImageTmpFromJson(json);

  @override
  @JsonKey(name: 'image_profile_url')
  final String? imageProfileUrl;
  @override
  @JsonKey(name: 'image_location')
  final String? imageLocation;
  @override
  @JsonKey(name: 'mime_type')
  final String? mimeType;

  @override
  String toString() {
    return 'ImageTmp(imageProfileUrl: $imageProfileUrl, imageLocation: $imageLocation, mimeType: $mimeType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ImageTmp &&
            (identical(other.imageProfileUrl, imageProfileUrl) ||
                other.imageProfileUrl == imageProfileUrl) &&
            (identical(other.imageLocation, imageLocation) ||
                other.imageLocation == imageLocation) &&
            (identical(other.mimeType, mimeType) ||
                other.mimeType == mimeType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, imageProfileUrl, imageLocation, mimeType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ImageTmpCopyWith<_$_ImageTmp> get copyWith =>
      __$$_ImageTmpCopyWithImpl<_$_ImageTmp>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ImageTmpToJson(
      this,
    );
  }
}

abstract class _ImageTmp implements ImageTmp {
  const factory _ImageTmp(
      {@JsonKey(name: 'image_profile_url') final String? imageProfileUrl,
      @JsonKey(name: 'image_location') final String? imageLocation,
      @JsonKey(name: 'mime_type') final String? mimeType}) = _$_ImageTmp;

  factory _ImageTmp.fromJson(Map<String, dynamic> json) = _$_ImageTmp.fromJson;

  @override
  @JsonKey(name: 'image_profile_url')
  String? get imageProfileUrl;
  @override
  @JsonKey(name: 'image_location')
  String? get imageLocation;
  @override
  @JsonKey(name: 'mime_type')
  String? get mimeType;
  @override
  @JsonKey(ignore: true)
  _$$_ImageTmpCopyWith<_$_ImageTmp> get copyWith =>
      throw _privateConstructorUsedError;
}

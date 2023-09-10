// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'jwt_domain.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

JwtDomain _$JwtDomainFromJson(Map<String, dynamic> json) {
  return _JwtDomain.fromJson(json);
}

/// @nodoc
mixin _$JwtDomain {
  @JsonKey(name: 'access_token')
  String? get accessToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'refresh_token')
  String? get refreshToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JwtDomainCopyWith<JwtDomain> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JwtDomainCopyWith<$Res> {
  factory $JwtDomainCopyWith(JwtDomain value, $Res Function(JwtDomain) then) =
      _$JwtDomainCopyWithImpl<$Res, JwtDomain>;
  @useResult
  $Res call(
      {@JsonKey(name: 'access_token') String? accessToken,
      @JsonKey(name: 'refresh_token') String? refreshToken});
}

/// @nodoc
class _$JwtDomainCopyWithImpl<$Res, $Val extends JwtDomain>
    implements $JwtDomainCopyWith<$Res> {
  _$JwtDomainCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = freezed,
    Object? refreshToken = freezed,
  }) {
    return _then(_value.copyWith(
      accessToken: freezed == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      refreshToken: freezed == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_JwtDomainCopyWith<$Res> implements $JwtDomainCopyWith<$Res> {
  factory _$$_JwtDomainCopyWith(
          _$_JwtDomain value, $Res Function(_$_JwtDomain) then) =
      __$$_JwtDomainCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'access_token') String? accessToken,
      @JsonKey(name: 'refresh_token') String? refreshToken});
}

/// @nodoc
class __$$_JwtDomainCopyWithImpl<$Res>
    extends _$JwtDomainCopyWithImpl<$Res, _$_JwtDomain>
    implements _$$_JwtDomainCopyWith<$Res> {
  __$$_JwtDomainCopyWithImpl(
      _$_JwtDomain _value, $Res Function(_$_JwtDomain) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = freezed,
    Object? refreshToken = freezed,
  }) {
    return _then(_$_JwtDomain(
      accessToken: freezed == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      refreshToken: freezed == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_JwtDomain implements _JwtDomain {
  const _$_JwtDomain(
      {@JsonKey(name: 'access_token') this.accessToken,
      @JsonKey(name: 'refresh_token') this.refreshToken});

  factory _$_JwtDomain.fromJson(Map<String, dynamic> json) =>
      _$$_JwtDomainFromJson(json);

  @override
  @JsonKey(name: 'access_token')
  final String? accessToken;
  @override
  @JsonKey(name: 'refresh_token')
  final String? refreshToken;

  @override
  String toString() {
    return 'JwtDomain(accessToken: $accessToken, refreshToken: $refreshToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_JwtDomain &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, accessToken, refreshToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_JwtDomainCopyWith<_$_JwtDomain> get copyWith =>
      __$$_JwtDomainCopyWithImpl<_$_JwtDomain>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_JwtDomainToJson(
      this,
    );
  }
}

abstract class _JwtDomain implements JwtDomain {
  const factory _JwtDomain(
          {@JsonKey(name: 'access_token') final String? accessToken,
          @JsonKey(name: 'refresh_token') final String? refreshToken}) =
      _$_JwtDomain;

  factory _JwtDomain.fromJson(Map<String, dynamic> json) =
      _$_JwtDomain.fromJson;

  @override
  @JsonKey(name: 'access_token')
  String? get accessToken;
  @override
  @JsonKey(name: 'refresh_token')
  String? get refreshToken;
  @override
  @JsonKey(ignore: true)
  _$$_JwtDomainCopyWith<_$_JwtDomain> get copyWith =>
      throw _privateConstructorUsedError;
}

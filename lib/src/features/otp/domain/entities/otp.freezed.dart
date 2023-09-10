// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'otp.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Otp _$OtpFromJson(Map<String, dynamic> json) {
  return _Otp.fromJson(json);
}

/// @nodoc
mixin _$Otp {
  @JsonKey(name: "username")
  String? get username => throw _privateConstructorUsedError;
  @JsonKey(name: "otp")
  String? get otp => throw _privateConstructorUsedError;
  @JsonKey(name: "otpExp")
  String? get otpExp => throw _privateConstructorUsedError;
  @JsonKey(name: "secExp")
  int? get secExp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OtpCopyWith<Otp> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtpCopyWith<$Res> {
  factory $OtpCopyWith(Otp value, $Res Function(Otp) then) =
      _$OtpCopyWithImpl<$Res, Otp>;
  @useResult
  $Res call(
      {@JsonKey(name: "username") String? username,
      @JsonKey(name: "otp") String? otp,
      @JsonKey(name: "otpExp") String? otpExp,
      @JsonKey(name: "secExp") int? secExp});
}

/// @nodoc
class _$OtpCopyWithImpl<$Res, $Val extends Otp> implements $OtpCopyWith<$Res> {
  _$OtpCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = freezed,
    Object? otp = freezed,
    Object? otpExp = freezed,
    Object? secExp = freezed,
  }) {
    return _then(_value.copyWith(
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      otp: freezed == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String?,
      otpExp: freezed == otpExp
          ? _value.otpExp
          : otpExp // ignore: cast_nullable_to_non_nullable
              as String?,
      secExp: freezed == secExp
          ? _value.secExp
          : secExp // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OtpCopyWith<$Res> implements $OtpCopyWith<$Res> {
  factory _$$_OtpCopyWith(_$_Otp value, $Res Function(_$_Otp) then) =
      __$$_OtpCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "username") String? username,
      @JsonKey(name: "otp") String? otp,
      @JsonKey(name: "otpExp") String? otpExp,
      @JsonKey(name: "secExp") int? secExp});
}

/// @nodoc
class __$$_OtpCopyWithImpl<$Res> extends _$OtpCopyWithImpl<$Res, _$_Otp>
    implements _$$_OtpCopyWith<$Res> {
  __$$_OtpCopyWithImpl(_$_Otp _value, $Res Function(_$_Otp) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = freezed,
    Object? otp = freezed,
    Object? otpExp = freezed,
    Object? secExp = freezed,
  }) {
    return _then(_$_Otp(
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      otp: freezed == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String?,
      otpExp: freezed == otpExp
          ? _value.otpExp
          : otpExp // ignore: cast_nullable_to_non_nullable
              as String?,
      secExp: freezed == secExp
          ? _value.secExp
          : secExp // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Otp implements _Otp {
  const _$_Otp(
      {@JsonKey(name: "username") this.username,
      @JsonKey(name: "otp") this.otp,
      @JsonKey(name: "otpExp") this.otpExp,
      @JsonKey(name: "secExp") this.secExp});

  factory _$_Otp.fromJson(Map<String, dynamic> json) => _$$_OtpFromJson(json);

  @override
  @JsonKey(name: "username")
  final String? username;
  @override
  @JsonKey(name: "otp")
  final String? otp;
  @override
  @JsonKey(name: "otpExp")
  final String? otpExp;
  @override
  @JsonKey(name: "secExp")
  final int? secExp;

  @override
  String toString() {
    return 'Otp(username: $username, otp: $otp, otpExp: $otpExp, secExp: $secExp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Otp &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.otp, otp) || other.otp == otp) &&
            (identical(other.otpExp, otpExp) || other.otpExp == otpExp) &&
            (identical(other.secExp, secExp) || other.secExp == secExp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, username, otp, otpExp, secExp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OtpCopyWith<_$_Otp> get copyWith =>
      __$$_OtpCopyWithImpl<_$_Otp>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OtpToJson(
      this,
    );
  }
}

abstract class _Otp implements Otp {
  const factory _Otp(
      {@JsonKey(name: "username") final String? username,
      @JsonKey(name: "otp") final String? otp,
      @JsonKey(name: "otpExp") final String? otpExp,
      @JsonKey(name: "secExp") final int? secExp}) = _$_Otp;

  factory _Otp.fromJson(Map<String, dynamic> json) = _$_Otp.fromJson;

  @override
  @JsonKey(name: "username")
  String? get username;
  @override
  @JsonKey(name: "otp")
  String? get otp;
  @override
  @JsonKey(name: "otpExp")
  String? get otpExp;
  @override
  @JsonKey(name: "secExp")
  int? get secExp;
  @override
  @JsonKey(ignore: true)
  _$$_OtpCopyWith<_$_Otp> get copyWith => throw _privateConstructorUsedError;
}

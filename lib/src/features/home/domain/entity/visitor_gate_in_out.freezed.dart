// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'visitor_gate_in_out.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VisitorGateInOut _$VisitorGateInOutFromJson(Map<String, dynamic> json) {
  return _VisitorGateInOut.fromJson(json);
}

/// @nodoc
mixin _$VisitorGateInOut {
  String? get username => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  int? get idManifest => throw _privateConstructorUsedError;
  String? get gateinDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VisitorGateInOutCopyWith<VisitorGateInOut> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VisitorGateInOutCopyWith<$Res> {
  factory $VisitorGateInOutCopyWith(
          VisitorGateInOut value, $Res Function(VisitorGateInOut) then) =
      _$VisitorGateInOutCopyWithImpl<$Res, VisitorGateInOut>;
  @useResult
  $Res call(
      {String? username, String? name, int? idManifest, String? gateinDate});
}

/// @nodoc
class _$VisitorGateInOutCopyWithImpl<$Res, $Val extends VisitorGateInOut>
    implements $VisitorGateInOutCopyWith<$Res> {
  _$VisitorGateInOutCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = freezed,
    Object? name = freezed,
    Object? idManifest = freezed,
    Object? gateinDate = freezed,
  }) {
    return _then(_value.copyWith(
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      idManifest: freezed == idManifest
          ? _value.idManifest
          : idManifest // ignore: cast_nullable_to_non_nullable
              as int?,
      gateinDate: freezed == gateinDate
          ? _value.gateinDate
          : gateinDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_VisitorGateInOutCopyWith<$Res>
    implements $VisitorGateInOutCopyWith<$Res> {
  factory _$$_VisitorGateInOutCopyWith(
          _$_VisitorGateInOut value, $Res Function(_$_VisitorGateInOut) then) =
      __$$_VisitorGateInOutCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? username, String? name, int? idManifest, String? gateinDate});
}

/// @nodoc
class __$$_VisitorGateInOutCopyWithImpl<$Res>
    extends _$VisitorGateInOutCopyWithImpl<$Res, _$_VisitorGateInOut>
    implements _$$_VisitorGateInOutCopyWith<$Res> {
  __$$_VisitorGateInOutCopyWithImpl(
      _$_VisitorGateInOut _value, $Res Function(_$_VisitorGateInOut) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = freezed,
    Object? name = freezed,
    Object? idManifest = freezed,
    Object? gateinDate = freezed,
  }) {
    return _then(_$_VisitorGateInOut(
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      idManifest: freezed == idManifest
          ? _value.idManifest
          : idManifest // ignore: cast_nullable_to_non_nullable
              as int?,
      gateinDate: freezed == gateinDate
          ? _value.gateinDate
          : gateinDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_VisitorGateInOut implements _VisitorGateInOut {
  const _$_VisitorGateInOut(
      {this.username, this.name, this.idManifest, this.gateinDate});

  factory _$_VisitorGateInOut.fromJson(Map<String, dynamic> json) =>
      _$$_VisitorGateInOutFromJson(json);

  @override
  final String? username;
  @override
  final String? name;
  @override
  final int? idManifest;
  @override
  final String? gateinDate;

  @override
  String toString() {
    return 'VisitorGateInOut(username: $username, name: $name, idManifest: $idManifest, gateinDate: $gateinDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VisitorGateInOut &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.idManifest, idManifest) ||
                other.idManifest == idManifest) &&
            (identical(other.gateinDate, gateinDate) ||
                other.gateinDate == gateinDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, username, name, idManifest, gateinDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VisitorGateInOutCopyWith<_$_VisitorGateInOut> get copyWith =>
      __$$_VisitorGateInOutCopyWithImpl<_$_VisitorGateInOut>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VisitorGateInOutToJson(
      this,
    );
  }
}

abstract class _VisitorGateInOut implements VisitorGateInOut {
  const factory _VisitorGateInOut(
      {final String? username,
      final String? name,
      final int? idManifest,
      final String? gateinDate}) = _$_VisitorGateInOut;

  factory _VisitorGateInOut.fromJson(Map<String, dynamic> json) =
      _$_VisitorGateInOut.fromJson;

  @override
  String? get username;
  @override
  String? get name;
  @override
  int? get idManifest;
  @override
  String? get gateinDate;
  @override
  @JsonKey(ignore: true)
  _$$_VisitorGateInOutCopyWith<_$_VisitorGateInOut> get copyWith =>
      throw _privateConstructorUsedError;
}

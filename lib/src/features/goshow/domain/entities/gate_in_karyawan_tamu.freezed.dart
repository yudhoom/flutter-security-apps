// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'gate_in_karyawan_tamu.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GateInKaryawanTamu _$GateInKaryawanTamuFromJson(Map<String, dynamic> json) {
  return _GateInKaryawanTamu.fromJson(json);
}

/// @nodoc
mixin _$GateInKaryawanTamu {
  int? get idEvent => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GateInKaryawanTamuCopyWith<GateInKaryawanTamu> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GateInKaryawanTamuCopyWith<$Res> {
  factory $GateInKaryawanTamuCopyWith(
          GateInKaryawanTamu value, $Res Function(GateInKaryawanTamu) then) =
      _$GateInKaryawanTamuCopyWithImpl<$Res, GateInKaryawanTamu>;
  @useResult
  $Res call({int? idEvent});
}

/// @nodoc
class _$GateInKaryawanTamuCopyWithImpl<$Res, $Val extends GateInKaryawanTamu>
    implements $GateInKaryawanTamuCopyWith<$Res> {
  _$GateInKaryawanTamuCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idEvent = freezed,
  }) {
    return _then(_value.copyWith(
      idEvent: freezed == idEvent
          ? _value.idEvent
          : idEvent // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GateInKaryawanTamuCopyWith<$Res>
    implements $GateInKaryawanTamuCopyWith<$Res> {
  factory _$$_GateInKaryawanTamuCopyWith(_$_GateInKaryawanTamu value,
          $Res Function(_$_GateInKaryawanTamu) then) =
      __$$_GateInKaryawanTamuCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? idEvent});
}

/// @nodoc
class __$$_GateInKaryawanTamuCopyWithImpl<$Res>
    extends _$GateInKaryawanTamuCopyWithImpl<$Res, _$_GateInKaryawanTamu>
    implements _$$_GateInKaryawanTamuCopyWith<$Res> {
  __$$_GateInKaryawanTamuCopyWithImpl(
      _$_GateInKaryawanTamu _value, $Res Function(_$_GateInKaryawanTamu) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idEvent = freezed,
  }) {
    return _then(_$_GateInKaryawanTamu(
      idEvent: freezed == idEvent
          ? _value.idEvent
          : idEvent // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GateInKaryawanTamu implements _GateInKaryawanTamu {
  const _$_GateInKaryawanTamu({this.idEvent});

  factory _$_GateInKaryawanTamu.fromJson(Map<String, dynamic> json) =>
      _$$_GateInKaryawanTamuFromJson(json);

  @override
  final int? idEvent;

  @override
  String toString() {
    return 'GateInKaryawanTamu(idEvent: $idEvent)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GateInKaryawanTamu &&
            (identical(other.idEvent, idEvent) || other.idEvent == idEvent));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, idEvent);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GateInKaryawanTamuCopyWith<_$_GateInKaryawanTamu> get copyWith =>
      __$$_GateInKaryawanTamuCopyWithImpl<_$_GateInKaryawanTamu>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GateInKaryawanTamuToJson(
      this,
    );
  }
}

abstract class _GateInKaryawanTamu implements GateInKaryawanTamu {
  const factory _GateInKaryawanTamu({final int? idEvent}) =
      _$_GateInKaryawanTamu;

  factory _GateInKaryawanTamu.fromJson(Map<String, dynamic> json) =
      _$_GateInKaryawanTamu.fromJson;

  @override
  int? get idEvent;
  @override
  @JsonKey(ignore: true)
  _$$_GateInKaryawanTamuCopyWith<_$_GateInKaryawanTamu> get copyWith =>
      throw _privateConstructorUsedError;
}

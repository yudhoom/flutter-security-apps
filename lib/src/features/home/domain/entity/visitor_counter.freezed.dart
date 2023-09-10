// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'visitor_counter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VisitorCounter _$VisitorCounterFromJson(Map<String, dynamic> json) {
  return _VisitorCounter.fromJson(json);
}

/// @nodoc
mixin _$VisitorCounter {
  @JsonKey(name: 'expected_guest')
  int? get expectedGuest => throw _privateConstructorUsedError;
  @JsonKey(name: 'expected_vip')
  int? get expectedVip => throw _privateConstructorUsedError;
  @JsonKey(name: 'expected_regular')
  int? get expectedRegular => throw _privateConstructorUsedError;
  @JsonKey(name: 'real_visitor')
  int? get realVisitor => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VisitorCounterCopyWith<VisitorCounter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VisitorCounterCopyWith<$Res> {
  factory $VisitorCounterCopyWith(
          VisitorCounter value, $Res Function(VisitorCounter) then) =
      _$VisitorCounterCopyWithImpl<$Res, VisitorCounter>;
  @useResult
  $Res call(
      {@JsonKey(name: 'expected_guest') int? expectedGuest,
      @JsonKey(name: 'expected_vip') int? expectedVip,
      @JsonKey(name: 'expected_regular') int? expectedRegular,
      @JsonKey(name: 'real_visitor') int? realVisitor});
}

/// @nodoc
class _$VisitorCounterCopyWithImpl<$Res, $Val extends VisitorCounter>
    implements $VisitorCounterCopyWith<$Res> {
  _$VisitorCounterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expectedGuest = freezed,
    Object? expectedVip = freezed,
    Object? expectedRegular = freezed,
    Object? realVisitor = freezed,
  }) {
    return _then(_value.copyWith(
      expectedGuest: freezed == expectedGuest
          ? _value.expectedGuest
          : expectedGuest // ignore: cast_nullable_to_non_nullable
              as int?,
      expectedVip: freezed == expectedVip
          ? _value.expectedVip
          : expectedVip // ignore: cast_nullable_to_non_nullable
              as int?,
      expectedRegular: freezed == expectedRegular
          ? _value.expectedRegular
          : expectedRegular // ignore: cast_nullable_to_non_nullable
              as int?,
      realVisitor: freezed == realVisitor
          ? _value.realVisitor
          : realVisitor // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_VisitorCounterCopyWith<$Res>
    implements $VisitorCounterCopyWith<$Res> {
  factory _$$_VisitorCounterCopyWith(
          _$_VisitorCounter value, $Res Function(_$_VisitorCounter) then) =
      __$$_VisitorCounterCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'expected_guest') int? expectedGuest,
      @JsonKey(name: 'expected_vip') int? expectedVip,
      @JsonKey(name: 'expected_regular') int? expectedRegular,
      @JsonKey(name: 'real_visitor') int? realVisitor});
}

/// @nodoc
class __$$_VisitorCounterCopyWithImpl<$Res>
    extends _$VisitorCounterCopyWithImpl<$Res, _$_VisitorCounter>
    implements _$$_VisitorCounterCopyWith<$Res> {
  __$$_VisitorCounterCopyWithImpl(
      _$_VisitorCounter _value, $Res Function(_$_VisitorCounter) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expectedGuest = freezed,
    Object? expectedVip = freezed,
    Object? expectedRegular = freezed,
    Object? realVisitor = freezed,
  }) {
    return _then(_$_VisitorCounter(
      expectedGuest: freezed == expectedGuest
          ? _value.expectedGuest
          : expectedGuest // ignore: cast_nullable_to_non_nullable
              as int?,
      expectedVip: freezed == expectedVip
          ? _value.expectedVip
          : expectedVip // ignore: cast_nullable_to_non_nullable
              as int?,
      expectedRegular: freezed == expectedRegular
          ? _value.expectedRegular
          : expectedRegular // ignore: cast_nullable_to_non_nullable
              as int?,
      realVisitor: freezed == realVisitor
          ? _value.realVisitor
          : realVisitor // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_VisitorCounter implements _VisitorCounter {
  const _$_VisitorCounter(
      {@JsonKey(name: 'expected_guest') this.expectedGuest,
      @JsonKey(name: 'expected_vip') this.expectedVip,
      @JsonKey(name: 'expected_regular') this.expectedRegular,
      @JsonKey(name: 'real_visitor') this.realVisitor});

  factory _$_VisitorCounter.fromJson(Map<String, dynamic> json) =>
      _$$_VisitorCounterFromJson(json);

  @override
  @JsonKey(name: 'expected_guest')
  final int? expectedGuest;
  @override
  @JsonKey(name: 'expected_vip')
  final int? expectedVip;
  @override
  @JsonKey(name: 'expected_regular')
  final int? expectedRegular;
  @override
  @JsonKey(name: 'real_visitor')
  final int? realVisitor;

  @override
  String toString() {
    return 'VisitorCounter(expectedGuest: $expectedGuest, expectedVip: $expectedVip, expectedRegular: $expectedRegular, realVisitor: $realVisitor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VisitorCounter &&
            (identical(other.expectedGuest, expectedGuest) ||
                other.expectedGuest == expectedGuest) &&
            (identical(other.expectedVip, expectedVip) ||
                other.expectedVip == expectedVip) &&
            (identical(other.expectedRegular, expectedRegular) ||
                other.expectedRegular == expectedRegular) &&
            (identical(other.realVisitor, realVisitor) ||
                other.realVisitor == realVisitor));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, expectedGuest, expectedVip, expectedRegular, realVisitor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VisitorCounterCopyWith<_$_VisitorCounter> get copyWith =>
      __$$_VisitorCounterCopyWithImpl<_$_VisitorCounter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VisitorCounterToJson(
      this,
    );
  }
}

abstract class _VisitorCounter implements VisitorCounter {
  const factory _VisitorCounter(
          {@JsonKey(name: 'expected_guest') final int? expectedGuest,
          @JsonKey(name: 'expected_vip') final int? expectedVip,
          @JsonKey(name: 'expected_regular') final int? expectedRegular,
          @JsonKey(name: 'real_visitor') final int? realVisitor}) =
      _$_VisitorCounter;

  factory _VisitorCounter.fromJson(Map<String, dynamic> json) =
      _$_VisitorCounter.fromJson;

  @override
  @JsonKey(name: 'expected_guest')
  int? get expectedGuest;
  @override
  @JsonKey(name: 'expected_vip')
  int? get expectedVip;
  @override
  @JsonKey(name: 'expected_regular')
  int? get expectedRegular;
  @override
  @JsonKey(name: 'real_visitor')
  int? get realVisitor;
  @override
  @JsonKey(ignore: true)
  _$$_VisitorCounterCopyWith<_$_VisitorCounter> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'visitor_total.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VisitorTotal _$VisitorTotalFromJson(Map<String, dynamic> json) {
  return _VisitorTotal.fromJson(json);
}

/// @nodoc
mixin _$VisitorTotal {
  @JsonKey(name: 'total_visitor')
  int? get totalVisitor => throw _privateConstructorUsedError;
  @JsonKey(name: 'visitors')
  List<Visitor>? get visitors => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VisitorTotalCopyWith<VisitorTotal> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VisitorTotalCopyWith<$Res> {
  factory $VisitorTotalCopyWith(
          VisitorTotal value, $Res Function(VisitorTotal) then) =
      _$VisitorTotalCopyWithImpl<$Res, VisitorTotal>;
  @useResult
  $Res call(
      {@JsonKey(name: 'total_visitor') int? totalVisitor,
      @JsonKey(name: 'visitors') List<Visitor>? visitors});
}

/// @nodoc
class _$VisitorTotalCopyWithImpl<$Res, $Val extends VisitorTotal>
    implements $VisitorTotalCopyWith<$Res> {
  _$VisitorTotalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalVisitor = freezed,
    Object? visitors = freezed,
  }) {
    return _then(_value.copyWith(
      totalVisitor: freezed == totalVisitor
          ? _value.totalVisitor
          : totalVisitor // ignore: cast_nullable_to_non_nullable
              as int?,
      visitors: freezed == visitors
          ? _value.visitors
          : visitors // ignore: cast_nullable_to_non_nullable
              as List<Visitor>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_VisitorTotalCopyWith<$Res>
    implements $VisitorTotalCopyWith<$Res> {
  factory _$$_VisitorTotalCopyWith(
          _$_VisitorTotal value, $Res Function(_$_VisitorTotal) then) =
      __$$_VisitorTotalCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'total_visitor') int? totalVisitor,
      @JsonKey(name: 'visitors') List<Visitor>? visitors});
}

/// @nodoc
class __$$_VisitorTotalCopyWithImpl<$Res>
    extends _$VisitorTotalCopyWithImpl<$Res, _$_VisitorTotal>
    implements _$$_VisitorTotalCopyWith<$Res> {
  __$$_VisitorTotalCopyWithImpl(
      _$_VisitorTotal _value, $Res Function(_$_VisitorTotal) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalVisitor = freezed,
    Object? visitors = freezed,
  }) {
    return _then(_$_VisitorTotal(
      totalVisitor: freezed == totalVisitor
          ? _value.totalVisitor
          : totalVisitor // ignore: cast_nullable_to_non_nullable
              as int?,
      visitors: freezed == visitors
          ? _value._visitors
          : visitors // ignore: cast_nullable_to_non_nullable
              as List<Visitor>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_VisitorTotal implements _VisitorTotal {
  const _$_VisitorTotal(
      {@JsonKey(name: 'total_visitor') this.totalVisitor,
      @JsonKey(name: 'visitors') final List<Visitor>? visitors})
      : _visitors = visitors;

  factory _$_VisitorTotal.fromJson(Map<String, dynamic> json) =>
      _$$_VisitorTotalFromJson(json);

  @override
  @JsonKey(name: 'total_visitor')
  final int? totalVisitor;
  final List<Visitor>? _visitors;
  @override
  @JsonKey(name: 'visitors')
  List<Visitor>? get visitors {
    final value = _visitors;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'VisitorTotal(totalVisitor: $totalVisitor, visitors: $visitors)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VisitorTotal &&
            (identical(other.totalVisitor, totalVisitor) ||
                other.totalVisitor == totalVisitor) &&
            const DeepCollectionEquality().equals(other._visitors, _visitors));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, totalVisitor,
      const DeepCollectionEquality().hash(_visitors));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VisitorTotalCopyWith<_$_VisitorTotal> get copyWith =>
      __$$_VisitorTotalCopyWithImpl<_$_VisitorTotal>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VisitorTotalToJson(
      this,
    );
  }
}

abstract class _VisitorTotal implements VisitorTotal {
  const factory _VisitorTotal(
          {@JsonKey(name: 'total_visitor') final int? totalVisitor,
          @JsonKey(name: 'visitors') final List<Visitor>? visitors}) =
      _$_VisitorTotal;

  factory _VisitorTotal.fromJson(Map<String, dynamic> json) =
      _$_VisitorTotal.fromJson;

  @override
  @JsonKey(name: 'total_visitor')
  int? get totalVisitor;
  @override
  @JsonKey(name: 'visitors')
  List<Visitor>? get visitors;
  @override
  @JsonKey(ignore: true)
  _$$_VisitorTotalCopyWith<_$_VisitorTotal> get copyWith =>
      throw _privateConstructorUsedError;
}

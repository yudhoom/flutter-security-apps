// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'login.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Login _$LoginFromJson(Map<String, dynamic> json) {
  return _Login.fromJson(json);
}

/// @nodoc
mixin _$Login {
  @JsonKey(name: 'username')
  String? get username => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'grade')
  String? get grade => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_role')
  String? get userRole => throw _privateConstructorUsedError;
  @JsonKey(name: 'emails')
  List<Email>? get emails => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone')
  String? get phone => throw _privateConstructorUsedError;
  @JsonKey(name: 'pin_status')
  int? get pinStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'pin_status_desc')
  String? get pinStatusDesc => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_available')
  bool? get imageAvailable => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_profile_url')
  String? get imageProfileUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_change_password')
  String? get isChangePassword => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginCopyWith<Login> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginCopyWith<$Res> {
  factory $LoginCopyWith(Login value, $Res Function(Login) then) =
      _$LoginCopyWithImpl<$Res, Login>;
  @useResult
  $Res call(
      {@JsonKey(name: 'username') String? username,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'grade') String? grade,
      @JsonKey(name: 'user_role') String? userRole,
      @JsonKey(name: 'emails') List<Email>? emails,
      @JsonKey(name: 'phone') String? phone,
      @JsonKey(name: 'pin_status') int? pinStatus,
      @JsonKey(name: 'pin_status_desc') String? pinStatusDesc,
      @JsonKey(name: 'image_available') bool? imageAvailable,
      @JsonKey(name: 'image_profile_url') String? imageProfileUrl,
      @JsonKey(name: 'is_change_password') String? isChangePassword});
}

/// @nodoc
class _$LoginCopyWithImpl<$Res, $Val extends Login>
    implements $LoginCopyWith<$Res> {
  _$LoginCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = freezed,
    Object? name = freezed,
    Object? grade = freezed,
    Object? userRole = freezed,
    Object? emails = freezed,
    Object? phone = freezed,
    Object? pinStatus = freezed,
    Object? pinStatusDesc = freezed,
    Object? imageAvailable = freezed,
    Object? imageProfileUrl = freezed,
    Object? isChangePassword = freezed,
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
      grade: freezed == grade
          ? _value.grade
          : grade // ignore: cast_nullable_to_non_nullable
              as String?,
      userRole: freezed == userRole
          ? _value.userRole
          : userRole // ignore: cast_nullable_to_non_nullable
              as String?,
      emails: freezed == emails
          ? _value.emails
          : emails // ignore: cast_nullable_to_non_nullable
              as List<Email>?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      pinStatus: freezed == pinStatus
          ? _value.pinStatus
          : pinStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      pinStatusDesc: freezed == pinStatusDesc
          ? _value.pinStatusDesc
          : pinStatusDesc // ignore: cast_nullable_to_non_nullable
              as String?,
      imageAvailable: freezed == imageAvailable
          ? _value.imageAvailable
          : imageAvailable // ignore: cast_nullable_to_non_nullable
              as bool?,
      imageProfileUrl: freezed == imageProfileUrl
          ? _value.imageProfileUrl
          : imageProfileUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isChangePassword: freezed == isChangePassword
          ? _value.isChangePassword
          : isChangePassword // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoginCopyWith<$Res> implements $LoginCopyWith<$Res> {
  factory _$$_LoginCopyWith(_$_Login value, $Res Function(_$_Login) then) =
      __$$_LoginCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'username') String? username,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'grade') String? grade,
      @JsonKey(name: 'user_role') String? userRole,
      @JsonKey(name: 'emails') List<Email>? emails,
      @JsonKey(name: 'phone') String? phone,
      @JsonKey(name: 'pin_status') int? pinStatus,
      @JsonKey(name: 'pin_status_desc') String? pinStatusDesc,
      @JsonKey(name: 'image_available') bool? imageAvailable,
      @JsonKey(name: 'image_profile_url') String? imageProfileUrl,
      @JsonKey(name: 'is_change_password') String? isChangePassword});
}

/// @nodoc
class __$$_LoginCopyWithImpl<$Res> extends _$LoginCopyWithImpl<$Res, _$_Login>
    implements _$$_LoginCopyWith<$Res> {
  __$$_LoginCopyWithImpl(_$_Login _value, $Res Function(_$_Login) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = freezed,
    Object? name = freezed,
    Object? grade = freezed,
    Object? userRole = freezed,
    Object? emails = freezed,
    Object? phone = freezed,
    Object? pinStatus = freezed,
    Object? pinStatusDesc = freezed,
    Object? imageAvailable = freezed,
    Object? imageProfileUrl = freezed,
    Object? isChangePassword = freezed,
  }) {
    return _then(_$_Login(
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      grade: freezed == grade
          ? _value.grade
          : grade // ignore: cast_nullable_to_non_nullable
              as String?,
      userRole: freezed == userRole
          ? _value.userRole
          : userRole // ignore: cast_nullable_to_non_nullable
              as String?,
      emails: freezed == emails
          ? _value._emails
          : emails // ignore: cast_nullable_to_non_nullable
              as List<Email>?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      pinStatus: freezed == pinStatus
          ? _value.pinStatus
          : pinStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      pinStatusDesc: freezed == pinStatusDesc
          ? _value.pinStatusDesc
          : pinStatusDesc // ignore: cast_nullable_to_non_nullable
              as String?,
      imageAvailable: freezed == imageAvailable
          ? _value.imageAvailable
          : imageAvailable // ignore: cast_nullable_to_non_nullable
              as bool?,
      imageProfileUrl: freezed == imageProfileUrl
          ? _value.imageProfileUrl
          : imageProfileUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isChangePassword: freezed == isChangePassword
          ? _value.isChangePassword
          : isChangePassword // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Login implements _Login {
  const _$_Login(
      {@JsonKey(name: 'username') this.username,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'grade') this.grade,
      @JsonKey(name: 'user_role') this.userRole,
      @JsonKey(name: 'emails') final List<Email>? emails,
      @JsonKey(name: 'phone') this.phone,
      @JsonKey(name: 'pin_status') this.pinStatus,
      @JsonKey(name: 'pin_status_desc') this.pinStatusDesc,
      @JsonKey(name: 'image_available') this.imageAvailable,
      @JsonKey(name: 'image_profile_url') this.imageProfileUrl,
      @JsonKey(name: 'is_change_password') this.isChangePassword})
      : _emails = emails;

  factory _$_Login.fromJson(Map<String, dynamic> json) =>
      _$$_LoginFromJson(json);

  @override
  @JsonKey(name: 'username')
  final String? username;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'grade')
  final String? grade;
  @override
  @JsonKey(name: 'user_role')
  final String? userRole;
  final List<Email>? _emails;
  @override
  @JsonKey(name: 'emails')
  List<Email>? get emails {
    final value = _emails;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'phone')
  final String? phone;
  @override
  @JsonKey(name: 'pin_status')
  final int? pinStatus;
  @override
  @JsonKey(name: 'pin_status_desc')
  final String? pinStatusDesc;
  @override
  @JsonKey(name: 'image_available')
  final bool? imageAvailable;
  @override
  @JsonKey(name: 'image_profile_url')
  final String? imageProfileUrl;
  @override
  @JsonKey(name: 'is_change_password')
  final String? isChangePassword;

  @override
  String toString() {
    return 'Login(username: $username, name: $name, grade: $grade, userRole: $userRole, emails: $emails, phone: $phone, pinStatus: $pinStatus, pinStatusDesc: $pinStatusDesc, imageAvailable: $imageAvailable, imageProfileUrl: $imageProfileUrl, isChangePassword: $isChangePassword)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Login &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.grade, grade) || other.grade == grade) &&
            (identical(other.userRole, userRole) ||
                other.userRole == userRole) &&
            const DeepCollectionEquality().equals(other._emails, _emails) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.pinStatus, pinStatus) ||
                other.pinStatus == pinStatus) &&
            (identical(other.pinStatusDesc, pinStatusDesc) ||
                other.pinStatusDesc == pinStatusDesc) &&
            (identical(other.imageAvailable, imageAvailable) ||
                other.imageAvailable == imageAvailable) &&
            (identical(other.imageProfileUrl, imageProfileUrl) ||
                other.imageProfileUrl == imageProfileUrl) &&
            (identical(other.isChangePassword, isChangePassword) ||
                other.isChangePassword == isChangePassword));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      username,
      name,
      grade,
      userRole,
      const DeepCollectionEquality().hash(_emails),
      phone,
      pinStatus,
      pinStatusDesc,
      imageAvailable,
      imageProfileUrl,
      isChangePassword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoginCopyWith<_$_Login> get copyWith =>
      __$$_LoginCopyWithImpl<_$_Login>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LoginToJson(
      this,
    );
  }
}

abstract class _Login implements Login {
  const factory _Login(
      {@JsonKey(name: 'username')
          final String? username,
      @JsonKey(name: 'name')
          final String? name,
      @JsonKey(name: 'grade')
          final String? grade,
      @JsonKey(name: 'user_role')
          final String? userRole,
      @JsonKey(name: 'emails')
          final List<Email>? emails,
      @JsonKey(name: 'phone')
          final String? phone,
      @JsonKey(name: 'pin_status')
          final int? pinStatus,
      @JsonKey(name: 'pin_status_desc')
          final String? pinStatusDesc,
      @JsonKey(name: 'image_available')
          final bool? imageAvailable,
      @JsonKey(name: 'image_profile_url')
          final String? imageProfileUrl,
      @JsonKey(name: 'is_change_password')
          final String? isChangePassword}) = _$_Login;

  factory _Login.fromJson(Map<String, dynamic> json) = _$_Login.fromJson;

  @override
  @JsonKey(name: 'username')
  String? get username;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'grade')
  String? get grade;
  @override
  @JsonKey(name: 'user_role')
  String? get userRole;
  @override
  @JsonKey(name: 'emails')
  List<Email>? get emails;
  @override
  @JsonKey(name: 'phone')
  String? get phone;
  @override
  @JsonKey(name: 'pin_status')
  int? get pinStatus;
  @override
  @JsonKey(name: 'pin_status_desc')
  String? get pinStatusDesc;
  @override
  @JsonKey(name: 'image_available')
  bool? get imageAvailable;
  @override
  @JsonKey(name: 'image_profile_url')
  String? get imageProfileUrl;
  @override
  @JsonKey(name: 'is_change_password')
  String? get isChangePassword;
  @override
  @JsonKey(ignore: true)
  _$$_LoginCopyWith<_$_Login> get copyWith =>
      throw _privateConstructorUsedError;
}

Email _$EmailFromJson(Map<String, dynamic> json) {
  return _Email.fromJson(json);
}

/// @nodoc
mixin _$Email {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'email_address')
  String? get emailAddress => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EmailCopyWith<Email> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmailCopyWith<$Res> {
  factory $EmailCopyWith(Email value, $Res Function(Email) then) =
      _$EmailCopyWithImpl<$Res, Email>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'email_address') String? emailAddress});
}

/// @nodoc
class _$EmailCopyWithImpl<$Res, $Val extends Email>
    implements $EmailCopyWith<$Res> {
  _$EmailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? emailAddress = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      emailAddress: freezed == emailAddress
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EmailCopyWith<$Res> implements $EmailCopyWith<$Res> {
  factory _$$_EmailCopyWith(_$_Email value, $Res Function(_$_Email) then) =
      __$$_EmailCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'email_address') String? emailAddress});
}

/// @nodoc
class __$$_EmailCopyWithImpl<$Res> extends _$EmailCopyWithImpl<$Res, _$_Email>
    implements _$$_EmailCopyWith<$Res> {
  __$$_EmailCopyWithImpl(_$_Email _value, $Res Function(_$_Email) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? emailAddress = freezed,
  }) {
    return _then(_$_Email(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      emailAddress: freezed == emailAddress
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Email implements _Email {
  const _$_Email(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'email_address') this.emailAddress});

  factory _$_Email.fromJson(Map<String, dynamic> json) =>
      _$$_EmailFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'email_address')
  final String? emailAddress;

  @override
  String toString() {
    return 'Email(id: $id, emailAddress: $emailAddress)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Email &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.emailAddress, emailAddress) ||
                other.emailAddress == emailAddress));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, emailAddress);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EmailCopyWith<_$_Email> get copyWith =>
      __$$_EmailCopyWithImpl<_$_Email>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EmailToJson(
      this,
    );
  }
}

abstract class _Email implements Email {
  const factory _Email(
      {@JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'email_address') final String? emailAddress}) = _$_Email;

  factory _Email.fromJson(Map<String, dynamic> json) = _$_Email.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'email_address')
  String? get emailAddress;
  @override
  @JsonKey(ignore: true)
  _$$_EmailCopyWith<_$_Email> get copyWith =>
      throw _privateConstructorUsedError;
}

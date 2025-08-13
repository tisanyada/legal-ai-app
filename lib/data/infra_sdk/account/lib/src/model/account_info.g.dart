// @dart=3.5
// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=3.5

part of 'account_info.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const AccountInfoStatusEnum _$accountInfoStatusEnum_pending =
    const AccountInfoStatusEnum._('pending');
const AccountInfoStatusEnum _$accountInfoStatusEnum_active =
    const AccountInfoStatusEnum._('active');
const AccountInfoStatusEnum _$accountInfoStatusEnum_inactive =
    const AccountInfoStatusEnum._('inactive');
const AccountInfoStatusEnum _$accountInfoStatusEnum_shadowBanned =
    const AccountInfoStatusEnum._('shadowBanned');
const AccountInfoStatusEnum _$accountInfoStatusEnum_disabled =
    const AccountInfoStatusEnum._('disabled');

AccountInfoStatusEnum _$accountInfoStatusEnumValueOf(String name) {
  switch (name) {
    case 'pending':
      return _$accountInfoStatusEnum_pending;
    case 'active':
      return _$accountInfoStatusEnum_active;
    case 'inactive':
      return _$accountInfoStatusEnum_inactive;
    case 'shadowBanned':
      return _$accountInfoStatusEnum_shadowBanned;
    case 'disabled':
      return _$accountInfoStatusEnum_disabled;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<AccountInfoStatusEnum> _$accountInfoStatusEnumValues =
    new BuiltSet<AccountInfoStatusEnum>(const <AccountInfoStatusEnum>[
  _$accountInfoStatusEnum_pending,
  _$accountInfoStatusEnum_active,
  _$accountInfoStatusEnum_inactive,
  _$accountInfoStatusEnum_shadowBanned,
  _$accountInfoStatusEnum_disabled,
]);

Serializer<AccountInfoStatusEnum> _$accountInfoStatusEnumSerializer =
    new _$AccountInfoStatusEnumSerializer();

class _$AccountInfoStatusEnumSerializer
    implements PrimitiveSerializer<AccountInfoStatusEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'pending': 'pending',
    'active': 'active',
    'inactive': 'inactive',
    'shadowBanned': 'shadow_banned',
    'disabled': 'disabled',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'pending': 'pending',
    'active': 'active',
    'inactive': 'inactive',
    'shadow_banned': 'shadowBanned',
    'disabled': 'disabled',
  };

  @override
  final Iterable<Type> types = const <Type>[AccountInfoStatusEnum];
  @override
  final String wireName = 'AccountInfoStatusEnum';

  @override
  Object serialize(Serializers serializers, AccountInfoStatusEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  AccountInfoStatusEnum deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      AccountInfoStatusEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$AccountInfo extends AccountInfo {
  @override
  final String id;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String email;
  @override
  final String avatar;
  @override
  final AccountInfoStatusEnum status;

  factory _$AccountInfo([void Function(AccountInfoBuilder)? updates]) =>
      (new AccountInfoBuilder()..update(updates))._build();

  _$AccountInfo._(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.avatar,
      required this.status})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'AccountInfo', 'id');
    BuiltValueNullFieldError.checkNotNull(
        firstName, r'AccountInfo', 'firstName');
    BuiltValueNullFieldError.checkNotNull(lastName, r'AccountInfo', 'lastName');
    BuiltValueNullFieldError.checkNotNull(email, r'AccountInfo', 'email');
    BuiltValueNullFieldError.checkNotNull(avatar, r'AccountInfo', 'avatar');
    BuiltValueNullFieldError.checkNotNull(status, r'AccountInfo', 'status');
  }

  @override
  AccountInfo rebuild(void Function(AccountInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AccountInfoBuilder toBuilder() => new AccountInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AccountInfo &&
        id == other.id &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        email == other.email &&
        avatar == other.avatar &&
        status == other.status;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, firstName.hashCode);
    _$hash = $jc(_$hash, lastName.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, avatar.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AccountInfo')
          ..add('id', id)
          ..add('firstName', firstName)
          ..add('lastName', lastName)
          ..add('email', email)
          ..add('avatar', avatar)
          ..add('status', status))
        .toString();
  }
}

class AccountInfoBuilder implements Builder<AccountInfo, AccountInfoBuilder> {
  _$AccountInfo? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _firstName;
  String? get firstName => _$this._firstName;
  set firstName(String? firstName) => _$this._firstName = firstName;

  String? _lastName;
  String? get lastName => _$this._lastName;
  set lastName(String? lastName) => _$this._lastName = lastName;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _avatar;
  String? get avatar => _$this._avatar;
  set avatar(String? avatar) => _$this._avatar = avatar;

  AccountInfoStatusEnum? _status;
  AccountInfoStatusEnum? get status => _$this._status;
  set status(AccountInfoStatusEnum? status) => _$this._status = status;

  AccountInfoBuilder() {
    AccountInfo._defaults(this);
  }

  AccountInfoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _firstName = $v.firstName;
      _lastName = $v.lastName;
      _email = $v.email;
      _avatar = $v.avatar;
      _status = $v.status;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AccountInfo other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AccountInfo;
  }

  @override
  void update(void Function(AccountInfoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AccountInfo build() => _build();

  _$AccountInfo _build() {
    final _$result = _$v ??
        new _$AccountInfo._(
            id: BuiltValueNullFieldError.checkNotNull(id, r'AccountInfo', 'id'),
            firstName: BuiltValueNullFieldError.checkNotNull(
                firstName, r'AccountInfo', 'firstName'),
            lastName: BuiltValueNullFieldError.checkNotNull(
                lastName, r'AccountInfo', 'lastName'),
            email: BuiltValueNullFieldError.checkNotNull(
                email, r'AccountInfo', 'email'),
            avatar: BuiltValueNullFieldError.checkNotNull(
                avatar, r'AccountInfo', 'avatar'),
            status: BuiltValueNullFieldError.checkNotNull(
                status, r'AccountInfo', 'status'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

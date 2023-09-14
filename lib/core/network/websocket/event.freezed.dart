// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WebSocketEvent _$WebSocketEventFromJson(Map<String, dynamic> json) {
  return _WebSocketEvent.fromJson(json);
}

/// @nodoc
mixin _$WebSocketEvent {
  String get type => throw _privateConstructorUsedError;
  dynamic get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WebSocketEventCopyWith<WebSocketEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WebSocketEventCopyWith<$Res> {
  factory $WebSocketEventCopyWith(
          WebSocketEvent value, $Res Function(WebSocketEvent) then) =
      _$WebSocketEventCopyWithImpl<$Res, WebSocketEvent>;
  @useResult
  $Res call({String type, dynamic message});
}

/// @nodoc
class _$WebSocketEventCopyWithImpl<$Res, $Val extends WebSocketEvent>
    implements $WebSocketEventCopyWith<$Res> {
  _$WebSocketEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WebSocketEventCopyWith<$Res>
    implements $WebSocketEventCopyWith<$Res> {
  factory _$$_WebSocketEventCopyWith(
          _$_WebSocketEvent value, $Res Function(_$_WebSocketEvent) then) =
      __$$_WebSocketEventCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String type, dynamic message});
}

/// @nodoc
class __$$_WebSocketEventCopyWithImpl<$Res>
    extends _$WebSocketEventCopyWithImpl<$Res, _$_WebSocketEvent>
    implements _$$_WebSocketEventCopyWith<$Res> {
  __$$_WebSocketEventCopyWithImpl(
      _$_WebSocketEvent _value, $Res Function(_$_WebSocketEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? message = freezed,
  }) {
    return _then(_$_WebSocketEvent(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WebSocketEvent implements _WebSocketEvent {
  _$_WebSocketEvent({required this.type, required this.message});

  factory _$_WebSocketEvent.fromJson(Map<String, dynamic> json) =>
      _$$_WebSocketEventFromJson(json);

  @override
  final String type;
  @override
  final dynamic message;

  @override
  String toString() {
    return 'WebSocketEvent(type: $type, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WebSocketEvent &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, type, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WebSocketEventCopyWith<_$_WebSocketEvent> get copyWith =>
      __$$_WebSocketEventCopyWithImpl<_$_WebSocketEvent>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WebSocketEventToJson(
      this,
    );
  }
}

abstract class _WebSocketEvent implements WebSocketEvent {
  factory _WebSocketEvent(
      {required final String type,
      required final dynamic message}) = _$_WebSocketEvent;

  factory _WebSocketEvent.fromJson(Map<String, dynamic> json) =
      _$_WebSocketEvent.fromJson;

  @override
  String get type;
  @override
  dynamic get message;
  @override
  @JsonKey(ignore: true)
  _$$_WebSocketEventCopyWith<_$_WebSocketEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

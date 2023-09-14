import 'package:freezed_annotation/freezed_annotation.dart';

part 'event.freezed.dart';
part 'event.g.dart';

@freezed
class WebSocketEvent with _$WebSocketEvent {
  factory WebSocketEvent({
    required String type,
    required dynamic message,
  }) = _WebSocketEvent;

  factory WebSocketEvent.fromJson(Map<String, dynamic> json) =>
      _$WebSocketEventFromJson(json);
}

enum EventType {
  healthcheck,
}

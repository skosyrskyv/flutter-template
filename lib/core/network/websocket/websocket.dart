import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter_template/core/network/websocket/event.dart';
import 'package:flutter_template/core/network/websocket/timer.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;

typedef MessageHandler = void Function(WebSocketEvent);

class WebSocket with TimerHelper {
  final String baseURL;

  WebSocket({
    required this.baseURL,
  });

  MessageHandler? _messageHandler;
  WebSocketChannel? _channel;
  StreamSubscription? _channelSubscription;

  Future _init(Uri uri) async {
    if (_channel != null) {
      _closeWebSocketChannel();
    }
    _channel = WebSocketChannel.connect(uri);
    _subscribeWebsocketChannel();
  }

  void _subscribeWebsocketChannel() {
    if (_channelSubscription != null) {
      _unsubscribeWebsocketChannel();
    }
    _channelSubscription = _channel?.stream.listen(
      _onDataHandler,
      onError: _onErrorHandler,
      onDone: _onDoneHandler,
    );
  }

  void _unsubscribeWebsocketChannel() {
    _channelSubscription?.cancel();
  }

  void _closeWebSocketChannel({bool manuallyClosed = false}) {
    if (_channel != null) {
      _unsubscribeWebsocketChannel();
      _channel?.sink.close(manuallyClosed ? status.normalClosure : status.goingAway);
      _channel = null;
    }
  }

  void _onErrorHandler(dynamic error) {
    log('error');
    log(error);
    _reconnect();
  }

  void _onDataHandler(dynamic event) {
    late WebSocketEvent _event;
    try {
      _event = WebSocketEvent.fromJson(json.decode(event));
    } catch (e) {
      log(e.toString());
      return;
    }
    if (_event.type == 'healthcheck') return;

    if (_messageHandler != null) {
      _messageHandler!(_event);
    }
  }

  void _onDoneHandler({bool manually = false}) {
    log('ws connection done');
    if (manually) return;
    _reconnect();
  }

  void _startHealthConnectionWatching() {
    setPeriodicTimer(
      const Duration(seconds: 20),
      (_) {
        log('Sending Event: ${EventType.healthcheck}');
        final event = {
          "type": 'healthcheck',
        };
        var jsonEvent = jsonEncode(event);
        log(' sending message $jsonEvent');
        _channel?.sink.add(jsonEncode(event));
      },
    );
  }

  Future<Uri> _buildUri() async {
    return Uri.parse(baseURL);
  }

  void _reconnect() {
    log('Reconnecting ...');
    setTimer(
      const Duration(milliseconds: 1000),
      () async {
        final uri = await _buildUri();
        try {
          _init(uri);
        } catch (e) {
          _onErrorHandler(e);
        }
      },
    );
  }

  void sendMessage(Map<String, String> event) {
    _channel?.sink.add(jsonEncode(event));
  }

  Future<void> connect(MessageHandler handler) async {
    log('Connecting ...');
    cancelTimer();
    try {
      var uri = await _buildUri();
      _messageHandler = handler;
      await _init(uri);
      _startHealthConnectionWatching();
      log('Connected');
    } catch (error) {
      log('Connection error!');
      log(error.toString());
    }
  }

  void disconnect() {
    _closeWebSocketChannel();
    cancelTimer();
    log('Disconnected');
  }
}

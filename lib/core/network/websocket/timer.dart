import 'dart:async';

///
mixin TimerHelper {
  Timer? _timer;

  ///
  void setTimer(
    Duration duration,
    void Function() callback, {
    bool immediate = false,
  }) {
    final timer = Timer(duration, callback);
    if (immediate) callback();
    _timer = timer;
  }

  ///
  void setPeriodicTimer(
    Duration duration,
    void Function(Timer) callback, {
    bool immediate = false,
  }) {
    final timer = Timer.periodic(duration, callback);
    if (immediate) callback.call(timer);
    _timer = timer;
  }

  ///
  void cancelTimer() {
    _timer?.cancel();
    _timer = null;
  }
}

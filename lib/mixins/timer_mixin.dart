import 'dart:async';

import 'package:flutter/material.dart';

mixin TimerMixin {
  Timer? _timer;

  /// Track how many seconds left
  int secondsLeft = 0;

  /// Reset timer and start again.
  void startTimer({
    /// Duration in seconds.
    required int duration,

    /// Will be call once per second.
    VoidCallback? onTick,

    /// Will be called at 0 second before the first onTick callback.
    VoidCallback? onStart,

    /// Will be called when the timer finished after last onPeriod callback.
    VoidCallback? onFinish,
  }) {
    _resetTimer();
    if (secondsLeft == 0 && onStart != null) {
      onStart();
    }
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (onTick != null) {
          onTick();
        }
        if (secondsLeft == duration - 1) {
          if (onFinish != null) {
            onFinish();
          }
          stopTimer();
        }
        secondsLeft += 1;
      },
    );
  }

  _resetTimer() {
    _timer = null;
    secondsLeft = 0;
  }

  /// Stop timer
  /// Don't reset seconds left value
  stopTimer() {
    if (_timer != null) {
      _timer!.cancel();
    }
  }

  disposeTimer() {
    stopTimer();
    _resetTimer();
  }
}

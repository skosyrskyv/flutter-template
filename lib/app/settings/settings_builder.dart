import 'package:flutter/material.dart';
import 'package:flutter_template/app/runner.dart';
import 'package:flutter_template/app/settings/settings_controller.dart';

class SettingsBuilder extends StatelessWidget {
  final Widget child;
  const SettingsBuilder({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: getIt<SettingsController>(),
      builder: (_, __) => child,
    );
  }
}

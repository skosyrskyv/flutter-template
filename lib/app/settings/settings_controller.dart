import 'package:flutter/material.dart';
import 'package:flutter_template/app/theme/data/theme_service.dart';
import 'package:injectable/injectable.dart';

@singleton
class SettingsController extends ChangeNotifier {
  final ThemeService themeService;

  SettingsController({required this.themeService});

  ThemeMode get themeMode => themeService.themeMode();

  void setTheme(ThemeMode? mode) {
    if (mode == null) return;
    themeService.setThemeMode(mode);
    notifyListeners();
  }
}

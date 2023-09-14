import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/app/router/app_router.dart';
import 'package:flutter_template/app/runner.dart';
import 'package:flutter_template/app/theme/models/app_theme.dart';
import 'package:flutter_template/extensions/build_context_extension.dart';

final appRouter = AppRouter();

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter.config(),
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      themeMode: context.themeMode,
      theme: getIt<AppTheme>().lightTheme,
      darkTheme: getIt<AppTheme>().darkTheme,
      localizationsDelegates: context.localizationDelegates,
      debugShowCheckedModeBanner: false,
    );
  }
}

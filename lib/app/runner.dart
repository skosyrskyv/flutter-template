import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_template/app/app.dart';
import 'package:flutter_template/app/app_loading.dart';
import 'package:flutter_template/app/bloc/bloc_observer.dart';
import 'package:flutter_template/app/localization.dart';
import 'package:flutter_template/app/runner.config.dart';
import 'package:flutter_template/core/network/client/dio_client.dart';
import 'package:flutter_template/core/network/client/http_client.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

class Runner {
  static Future<void> run() async {
    runZonedGuarded(_runApp, _errorHandler);
  }

  static Future<void> _initializeFlutterPluginsAndDependencies() async {
    Bloc.observer = BlocObserverOverrides();
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
    await configureDependencies();
  }

  static Future<void> _initializeServices() async {
    // TODO: Add services init.
  }

  static _runApp() async {
    runApp(const AppLoading());
    await _initializeFlutterPluginsAndDependencies();
    await _initializeServices();
    runApp(
      const LocalizationProvider(
        child: App(),
      ),
    );
  }

  static Future<void> _errorHandler(exception, stacktrace) async {
    // TODO: Add sentry.
  }
}

// GET IT INITIALIZATION
@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
@module
abstract class InjectableModule {
  @preResolve
  @singleton
  Future<FlutterSecureStorage> get secureStore async => const FlutterSecureStorage();

  @preResolve
  @singleton
  Future<SharedPreferences> get prefs async => SharedPreferences.getInstance();

  @preResolve
  @singleton
  Future<IHttpClient> get client async => const DioClient();
}

Future<void> configureDependencies() async => await $initGetIt(getIt);

import 'package:dio/dio.dart';
import 'package:flutter_template/env.dart';

class DioClientSettings {
  static BaseOptions buildSettings() => BaseOptions(
        baseUrl: API_URL,
      );
}

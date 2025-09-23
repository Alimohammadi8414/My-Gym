import 'package:dio/dio.dart';

final Dio httpclient = Dio(
  BaseOptions(
    baseUrl: 'https://retoolapi.dev/',
  ),
);

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_pretty_dio_logger/flutter_pretty_dio_logger.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/core/network/end_point.dart';

import 'dio_interceptor.dart';

@module
abstract class DioFactory {
  @factoryMethod
  Dio getDio(CustomInterceptor customInterceptor) {
    final dio = Dio();

    dio.options
      ..baseUrl = EndPoints.baseUrl
      ..connectTimeout = const Duration(milliseconds: 60000)
      ..receiveTimeout = const Duration(milliseconds: 60000);

    dio.interceptors.add(customInterceptor);

    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        queryParameters: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
        showProcessingTime: false,
        showCUrl: false,
        canShowLog: kDebugMode,
      ),
    );
    return dio;
  }
}

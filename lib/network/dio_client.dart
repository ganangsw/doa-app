import 'package:dio/dio.dart';
import 'package:doa_app/core/api_config.dart';
import 'package:doa_app/network/dio_interceptor.dart';

class DioClient {
  static final DioClient _instance = DioClient._internal();
  late final Dio? dio;

  factory DioClient() => _instance;

  DioClient._internal() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConfig.baseUrl,
        connectTimeout: ApiConfig.connectionTimeout,
        receiveTimeout: ApiConfig.receiveTimeout,
        responseType: ResponseType.json,
      ),
    )..interceptors.add(DioInterceptor());
  }
}

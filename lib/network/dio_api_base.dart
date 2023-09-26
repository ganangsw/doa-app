import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart' show Response, DioException;

import 'dio_client.dart';
import 'dio_exception.dart';

abstract class DioApiBase<T> {
  final DioClient dioClient = DioClient();

  Future<Either<String, List<T>>> makeGetRequest(
      Future<Response<dynamic>> apiCallback,
      T Function(Map<String, dynamic> json) getJsonCallback) async {
    try {
      final Response response = await apiCallback;

      final List<T> dataList = List<T>.from(
        json.decode(json.encode(response.data)).map(
              (item) => getJsonCallback(item),
            ),
      );
      return right(dataList);
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return left(errorMessage);
    }
  }

  Future<Either<String, T>> makeGetRequest2(
    Future<Response<dynamic>> apiCallback,
    T Function(Map<String, dynamic> json) getJsonCallback,
  ) async {
    try {
      final Response response = await apiCallback;
      final jsonData = response.data as Map<String, dynamic>;
      final result = getJsonCallback(jsonData);
      return right(result);
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return left(errorMessage);
    }
  }
}

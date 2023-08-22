import 'package:dio/dio.dart';
import 'package:my_app/src/config/constants/endpoints.dart';
import 'package:my_app/src/network/model/common/result.dart';
import 'package:my_app/src/utils/helper/logger.dart';

class BaseDataSource {
  // dio instance
  final Dio _dio = Dio();

  // injecting dio instance
  BaseDataSource();

  // Get:-----------------------------------------------------------------------
  Future<Response> get<T>(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio
          .get(
            uri,
            queryParameters: queryParameters,
            options: options,
            cancelToken: cancelToken,
            onReceiveProgress: onReceiveProgress,
          )
          .timeout(const Duration(milliseconds: Endpoints.connectionTimeout));
      LoggerHelper.successApi('> GET RESPONSE [${response.statusCode}]<  $uri');

      return response;
    } catch (e) {
      LoggerHelper.errorApi('> API CATCH Error< $e');
      rethrow;
    }
  }

  // Post:----------------------------------------------------------------------
  Future<Response> post(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio
          .post(
            uri,
            data: data,
            queryParameters: queryParameters,
            options: options,
            cancelToken: cancelToken,
            onSendProgress: onSendProgress,
            onReceiveProgress: onReceiveProgress,
          )
          .timeout(const Duration(milliseconds: Endpoints.connectionTimeout));
      LoggerHelper.successApi(
        '> POST RESPONSE [${response.statusCode}]< $uri $data',
      );

      return response;
    } catch (e) {
      LoggerHelper.errorApi('> API CATCH Error< $e');
      rethrow;
    }
  }

  // Put:-----------------------------------------------------------------------
  Future<XResult<T>> put<T>(
    String uri, {
    required T data,
    required List<int> statusCodes,
    required Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio
          .put(
            uri,
            data: data,
            queryParameters: queryParameters,
            options: options,
            cancelToken: cancelToken,
            onSendProgress: onSendProgress,
            onReceiveProgress: onReceiveProgress,
          )
          .timeout(const Duration(milliseconds: Endpoints.connectionTimeout));
      LoggerHelper.successApi(
        '> PUT RESPONSE [${response.statusCode}]< $uri $data',
      );

      return statusCodes.contains(response.statusCode)
          ? XResult.success(response.data)
          : XResult.error(response.statusCode.toString());
    } catch (e) {
      LoggerHelper.errorApi('> API CATCH Error< $e');

      return XResult.exception(e);
    }
  }

  // Delete:--------------------------------------------------------------------
  Future<XResult<T>> delete<T>(
    String uri, {
    required T data,
    required List<int> statusCodes,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final Response response = await _dio
          .delete(
            uri,
            data: data,
            queryParameters: queryParameters,
            options: options,
            cancelToken: cancelToken,
          )
          .timeout(const Duration(milliseconds: Endpoints.connectionTimeout));
      LoggerHelper.successApi(
        '> DELETE RESPONSE [${response.statusCode}]< $uri $data',
      );

      return statusCodes.contains(response.statusCode)
          ? XResult.success(response.data)
          : XResult.error(response.statusCode.toString());
    } catch (e) {
      LoggerHelper.errorApi('> API CATCH Error< $e');

      return XResult.exception(e);
    }
  }
}

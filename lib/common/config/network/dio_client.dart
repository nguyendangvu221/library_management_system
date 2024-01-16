import 'package:dio/dio.dart';
import 'package:library_management_system/common/config/network/endpoint.dart';

class DioClient {
  final _dio = Dio(
    BaseOptions(
      baseUrl: Endpoints.baseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      responseType: ResponseType.json,
    ),
  );
  Future<Response> get({required String endpoint, Map<String, dynamic>? queryParameters}) async {
    final String url = '${_dio.options.baseUrl}$endpoint';

    try {
      final response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: Options(),
      );
      return response;
    } catch (error) {
      throw DioException(
        requestOptions: RequestOptions(path: endpoint),
        error: error.toString(),
      );
    }
  }

  // Phương thức POST với yêu cầu Authorization
  Future<Response> post({required String endpoint, dynamic data}) async {
    final String url = '${_dio.options.baseUrl}$endpoint';
    try {
      final response = await _dio.post(
        url,
        data: data,
        options: Options(),
      );
      return response;
    } catch (error) {
      throw DioException(
        requestOptions: RequestOptions(path: endpoint),
        error: error.toString(),
      );
    }
  }

  // Phương thức PUT với yêu cầu Authorization
  Future<Response> put({required String endpoint, required dynamic data}) async {
    final String url = '${_dio.options.baseUrl}$endpoint';
    try {
      final response = await _dio.put(
        url,
        data: data,
        options: Options(),
      );
      return response;
    } catch (error) {
      throw DioException(
        requestOptions: RequestOptions(path: endpoint),
        error: error.toString(),
      );
    }
  }

  // Phương thức DELETE với yêu cầu Authorization
  Future<Response> delete({required String endpoint}) async {
    final String url = '${_dio.options.baseUrl}$endpoint';
    try {
      final response = await _dio.delete(
        url,
        options: Options(),
      );
      return response;
    } catch (error) {
      throw DioException(
        requestOptions: RequestOptions(path: endpoint),
        error: error.toString(),
      );
    }
  }
}

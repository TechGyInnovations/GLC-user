

import 'package:dio/dio.dart';

import 'api_urls.dart';

class BaseApiClient {
  late Dio _dio;

  BaseApiClient() {
    _dio = Dio(BaseOptions(
      baseUrl: ApiConstants.baseUrl, // Base URL from your constants
      connectTimeout: const Duration(seconds: 120),
      receiveTimeout: const Duration(seconds: 120),
    ));

    // Interceptors for logging, token handling, etc.
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // You can add token dynamically here if needed
        options.headers['Authorization'] =
            'Bearer YOUR_TOKEN'; // Add token if needed
        return handler.next(options); // Proceed with request
      },
      onResponse: (response, handler) {
        // Log response if needed
        return handler.next(response); // Proceed with response
      },
      onError: (error, handler) {
        // Handle global errors like network issues, timeouts
        return handler.next(error); // Proceed with error
      },
    ));
  }

  // Generic POST method for both raw data, form-data, and multipart
  Future<T> post<T>(
    String url,
    dynamic payload, {
    required T Function(Map<String, dynamic>) fromJson,
    Map<String, String>? headers,
    bool isFormData = false,
    bool isJson = true,
    bool isMultipart = false,
  }) async {
    try {
      final options = Options(
        headers: headers ?? {},
        contentType: isFormData
            ? 'application/x-www-form-urlencoded'
            : isJson
                ? 'application/json'
                : isMultipart
                    ? 'multipart/form-data'
                    : 'application/octet-stream', // Default for raw binary data
      );

      Response response;
      if (isMultipart) {
        // Send a multipart request
        response = await _dio.post(url,
            data: FormData.fromMap(payload), options: options);
      } else {
        // For JSON or Form Data
        response = await _dio.post(url, data: payload, options: options);
      }

      if (response.statusCode == 200) {
        return fromJson(response.data); // Parse the response data
      } else {
        throw Exception('Failed to load data');
      }
    } on DioException catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  // Generic GET method with parameters and headers
  Future<T> get<T>(
    String url, {
    Map<String, dynamic>? params,
    required T Function(Map<String, dynamic>) fromJson,
    Map<String, String>? headers,
  }) async {
    try {
      final response = await _dio.get(url,
          queryParameters: params, options: Options(headers: headers));
      if (response.statusCode == 200) {
        return fromJson(response.data); // Parse the response data
      } else {
        throw Exception('Failed to load data');
      }
    } on DioException catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  // Generic PUT method for updating data
  Future<T> put<T>(
    String url,
    dynamic payload, {
    required T Function(Map<String, dynamic>) fromJson,
    Map<String, String>? headers,
    bool isFormData = false,
    bool isJson = true,
    bool isMultipart = false,
  }) async {
    try {
      final options = Options(
        headers: headers ?? {},
        contentType: isFormData
            ? 'application/x-www-form-urlencoded'
            : isJson
                ? 'application/json'
                : isMultipart
                    ? 'multipart/form-data'
                    : 'application/octet-stream', // Default for raw binary data
      );

      Response response;
      if (isMultipart) {
        // Send a multipart PUT request
        response = await _dio.put(url,
            data: FormData.fromMap(payload), options: options);
      } else {
        // For JSON or Form Data
        response = await _dio.put(url, data: payload, options: options);
      }

      if (response.statusCode == 200) {
        return fromJson(response.data); // Parse the response data
      } else {
        throw Exception('Failed to load data');
      }
    } on DioException catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  // Generic DELETE method for deleting data
  Future<T> delete<T>(
    String url,
    Map<String, dynamic> params, {
    required T Function(Map<String, dynamic>) fromJson,
    Map<String, String>? headers,
  }) async {
    try {
      final response = await _dio.delete(url,
          queryParameters: params, options: Options(headers: headers));
      if (response.statusCode == 200) {
        return fromJson(response.data); // Parse the response data
      } else {
        throw Exception('Failed to load data');
      }
    } on DioException catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  // Handle errors globally
  void _handleError(DioException error) {
    if (error.response != null) {
      final int statusCode = error.response?.statusCode ?? 0;
      switch (statusCode) {
        case 400:
          throw Exception('Bad Request: ${error.response?.data}');
        case 401:
          throw Exception('Unauthorized');
        case 500:
          throw Exception('Internal Server Error');
        default:
          throw Exception('An unknown error occurred');
      }
    } else {
      throw Exception('Network error or timeout');
    }
  }
}

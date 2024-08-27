import 'package:cats/http_client/urls.dart';
import 'package:dio/dio.dart';
import 'dart:developer';
import 'dart:async';
import 'dart:io';

/// Duration for both time outs, send and receive.
const Duration timeOut = Duration(seconds: 30);

BaseOptions kBaseOptions = BaseOptions(
  baseUrl: AppUrl.baseUrl,
  sendTimeout: timeOut,
  receiveTimeout: timeOut,
  headers: {
    "Content-Type": "application/json",
  },
);

var kOptions = Options(headers: kBaseOptions.headers);

/// Class HttpClient created for all API calls.
///
/// This class has the 4 methos for CRUD operations.
///
/// Methods [get], [post], [updatePost] and [deletePost].
class HttpClient {
  HttpClient._();
  static final HttpClient _instance = HttpClient._();
  factory HttpClient() => _instance;

  /// Show logs in console.
  static const bool showLogs = true;

  /// Instance of Dio service for future HTTP requets.
  final _dio = Dio()..options = kBaseOptions;

  /// Method used to set the authorization token.
  void setAuthConfig(String token) async {
    _dio.options.headers["x-api-key"] = token;
  }

  /// Method used to delete the authorization token.
  void removeAuthConfig() {
    _dio.options.headers.remove("x-api-key");
  }

  /// Method [get] to fetch information from an endpoint.
  ///
  /// This method requires a String variable [endpoint] that indicates the enpoint from which the information is obtained.
  ///
  /// Likewise, this method returns a decoded json object as a response in the success case,
  ///
  /// but if an exception is catched, it will be returned instead.
  Future<Response<T>> get<T>({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    _printRequestLog(
      method: "GET",
      endpoint: endpoint,
      queryParameters: queryParameters,
    );
    return _dio.get(
      endpoint,
      queryParameters: queryParameters,
      options: options,
    );
  }

  /// Method [post] to post information to an endpoint.
  ///
  /// This method requires a String variable [endpoint] that indicates the enpoint where the information is gonna be posted.
  ///
  /// Also, requires a Map variable [body] that contains all the information that is gonna be posted.
  ///
  /// Likewise, this method returns a decoded json object as a response in the success case,
  ///
  /// but if an exception is catched, it will be returned instead.
  Future<Response<T>> post<T>({
    required String endpoint,
    required Map<String, dynamic> body,
  }) async {
    _printRequestLog(method: "POST", endpoint: endpoint, body: body);
    return _runSafeRequest<T>(
      request: _dio.post(endpoint, data: body),
    );
  }

  /// Method [put] to update an already posted information to an endpoint.
  ///
  /// This method requires a String variable [endpoint] that indicates the enpoint where the information is gonna be posted and updated.
  ///
  /// Also, requires a Map variable [body] that contains all the information that is gonna be posted and updated.
  ///
  /// Likewise, this method returns a decoded json object as a response in the success case,
  ///
  /// but if an exception is catched, it will be returned instead.
  Future<Response> put<T>({
    required String endpoint,
    required Map<String, dynamic> body,
  }) async {
    _printRequestLog(method: "PUT", endpoint: endpoint);
    return _runSafeRequest(
      request: _dio.put(endpoint, data: body),
    );
  }

  /// Method [delete] to delete information from an endpoint.
  ///
  /// This method requires a String variable [endpoint] that indicates the enpoint where the information is gonna be deleted.
  ///
  /// Likewise, this method returns null as a response in the success case,
  ///
  /// but if an exception is catched, it will be returned instead.
  Future<Response<T>> delete<T>({
    required String endpoint,
    required Map<String, dynamic> body,
  }) async {
    _printRequestLog(method: "DELETE", endpoint: endpoint);
    return _runSafeRequest(
      request: _dio.delete(endpoint, data: body),
    );
  }

  Future<Response<T>> _runSafeRequest<T>({
    required Future<Response<dynamic>> request,
  }) async {
    try {
      return await request as Future<Response<T>>;
    } on DioException catch (e) {
      if (e.error is SocketException) {
        throw "NO_INTERNET_CONNECTION";
      }
      if ([DioExceptionType.receiveTimeout, DioExceptionType.sendTimeout]
          .contains(e.type)) {
        throw "REQUEST_TIMEOUT";
      }
      if (e.response?.statusCode == 500) {
        var code = e.response?.data["code"] as String?;
        var message = e.response?.data["message"] as String?;
        throw "INTERNAL_SERVER_ERROR $code $message";
      }
      log("======================= ERROR ===========================");
      log(e.toString());
      throw "GENERAL_ERROR ${e.response}";
    }
  }

  void _printRequestLog({
    required String method,
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
  }) {
    final completeEndpoint = Uri.parse(_dio.options.baseUrl + endpoint);
    if (showLogs) {
      log("HTTP DIO new request ($method)");
      log("HTTP DIO request endpoint: $completeEndpoint");
      log("HTTP DIO request headers: ${_dio.options.headers}");
      log("HTTP DIO request query parameters: $queryParameters");
      log("HTTP DIO request body: $body");
    }
  }
}

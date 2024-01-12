import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:finx/core/api/endpoint.dart';
import 'package:finx/core/services/storage_services/storage.dart';
import 'package:finx/features/onboarding/screen/onboarding.dart';
import 'package:flutter/cupertino.dart';

import 'package:get/get.dart' as g;

class Api {
  final Dio _dio;
  Api(this._dio) {
    initializeDio();
  }
  set setDioHeaders(Map<String, dynamic> data) => _dio.options.headers = data;

  /// This allows you set [header] options outside the api class
  void setExtraHeaders(Map<String, dynamic> newHeaders) {
    Map<String, dynamic> existingHeaders = _dio.options.headers;
    newHeaders.forEach((key, value) =>
        existingHeaders.update(key, (_) => value, ifAbsent: () => value));
    _dio.options.headers = existingHeaders;
  }

  void initializeDio() {
    _dio.options = BaseOptions(
        connectTimeout: const Duration(minutes: 8),
        receiveTimeout: const Duration(minutes: 8),
        baseUrl: Endpoints.baseUrl,
        contentType: "application/json",
        headers: {
          "accept": "application/json",
        });

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: requestInterceptors,
      onError: onErrorInterceptorHandler,
      onResponse: responseInterceptors,
    ));

    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
  }

  requestInterceptors(RequestOptions requestOptions,
      RequestInterceptorHandler requestInterceptorHandler) async {
    //await setToken(requestOptions);

    requestOptions.uri.path.replaceAll("+", " ");

    requestOptions.headers.addAll({
      "accept": "application/json",
      "content-type": "application/json",
      "Authorization": "Bearer sk_test_tvfjjVHLoh91p5eqPJzzej32LtNWPgMvTykSf7E6"
    });

    debugPrint('REQUEST URI ==============> ${requestOptions.uri}');
    debugPrint('REQUEST METHODS ==============> ${requestOptions.method}');
    debugPrint('REQUEST HEADERS ==============> ${requestOptions.headers}');
    debugPrint('REQUEST DATA ==============> ${requestOptions.data}');
    return requestInterceptorHandler.next(requestOptions);
  }

  // Future setToken(RequestOptions option) async {
  //   option.headers = {
  //     "Authorization": "Bearer sk_test_tvfjjVHLoh91p5eqPJzzej32LtNWPgMvTykSf7E6"
  //   };
  // }

  errorInterceptors(
      DioError dioError, ErrorInterceptorHandler errorInterceptorHandler) {
    return errorInterceptorHandler.next(dioError);
  }

  responseInterceptors(Response<dynamic> response,
      ResponseInterceptorHandler responseInterceptorHandler) {
    "======================================================================>";

    debugPrint("RESPONSE DATA ==============>  ${response.data}");
    debugPrint("RESPONSE HEADERS ==============>  ${response.headers}");
    debugPrint("RESPONSE STATUSCODE ==============>  ${response.statusCode}");
    debugPrint(
        "RESPONSE STATUSMESSAGE ==============>  ${response.statusMessage}");
    "======================================================================>";
    return responseInterceptorHandler.next(response);
  }

  apiResponse({dynamic message, dynamic errorCode}) {
    return {
      "message": message ?? "an_error_occurred_please_try_again",
      "errorCode": errorCode ?? "000",
    };
  }

  onErrorInterceptorHandler(DioError e, handler) async {
    if (e.response!.statusCode.toString().contains("401")) {
      final prefs = StorageService();
      await prefs.clearStorage();
      g.Get.offAll(() => const OnBoardingScreen());
    }

    return handler.next(e); //continue
  }

  Dio get dio => _dio;

  Response? handleError(DioError? e) {
    // debugPrint();
    debugPrint(
        "=============================[ALERT-😱😱😱]: ${e?.requestOptions.uri} ");
    debugPrint(
        "=====================================: [ALERT-😱😱😱] ${e?.error} ");
    debugPrint(
        "=====================================: [ALERT-😱😱😱] ${e?.response?.statusCode}");
    debugPrint(
        "=====================================: [ALERT-😱😱😱] ${e?.response?.data}");

    Response? response;

    switch (e?.type) {
      case DioErrorType.cancel:
        response = Response(
          data: apiResponse(
            message: 'Request cancelled!',
          ),
          requestOptions: RequestOptions(path: ''),
        );
        break;
      case DioErrorType.connectionTimeout:
        response = Response(
          data: apiResponse(
            message: "Network connection timed out!",
          ),
          requestOptions: RequestOptions(path: ''),
        );
        break;
      case DioErrorType.receiveTimeout:
        response = Response(
          data: apiResponse(
            message: "Something went wrong. Please try again later!",
          ),
          requestOptions: RequestOptions(path: ''),
        );
        break;
      case DioErrorType.sendTimeout:
        response = Response(
          data: apiResponse(
            message: "Something went wrong. Please try again later",
          ),
          requestOptions: RequestOptions(path: ''),
        );
        break;

      case DioErrorType.unknown:
        if (e?.error is SocketException) {
          g.Get.offAll(() => const OnBoardingScreen());
          // g.Get.find<GlobalCtr>().showNetworkErrorModal();
        } else if (e?.error is HttpException) {
          response = Response(
            data: apiResponse(
              message: "Network connection issue",
            ),
            requestOptions: RequestOptions(path: ''),
          );
        }
        break;
      default:
        if (e!.response!.data.runtimeType == String &&
            e.error.toString().contains("404")) {
          response = Response(
            data: apiResponse(
              message: "An error occurred, please try again",
              errorCode: '404',
            ),
            requestOptions: RequestOptions(path: ''),
          );
        } else if (e.response?.data.runtimeType == String &&
            e.error.toString().contains("400")) {
          response = Response(
            data: apiResponse(
              message:
                  e.response?.data ?? "An error occurred, please try again",
              errorCode: '400',
            ),
            requestOptions: RequestOptions(path: ''),
          );
        } else if (e.response?.data.runtimeType == String &&
            e.error.toString().contains("422")) {
          response = Response(
            data: apiResponse(
              message:
                  e.response?.data ?? "An error occurred, please try again",
              errorCode: '422',
            ),
            requestOptions: RequestOptions(path: ''),
          );
        } else if (e.response!.statusCode == 401) {
          response = Response(
            data: apiResponse(
              message:
                  e.response?.data ?? "An error occurred, please try again",
              errorCode: '401',
            ),
            requestOptions: RequestOptions(path: ''),
          );
        } else if (e.response!.statusCode == 500) {
          response = Response(
              requestOptions: RequestOptions(path: ''),
              data: apiResponse(
                  message: e.response?.data ?? 'Internal Server Error',
                  errorCode: '500'));
        } else {
          response = Response(
              data: apiResponse(
                  message: e.response!.data ?? "null",
                  errorCode: e.response!.data["errorCode"] ?? "null"),
              statusCode: e.response?.statusCode ?? 000,
              requestOptions: RequestOptions(path: ''));
        }
    }
    return response;
  }

  // Returns the same instance of dio throughout the application
  Api clone() => Api(_dio);
}

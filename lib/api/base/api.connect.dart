import 'dart:convert';

import 'package:get/get.dart';
import 'package:ma_friperie/api/base/api.response.dart';
import 'package:ma_friperie/api/base/routes/api.routes.dart';

class MainApiConnect extends GetConnect {
  static String get currentDomain => MainApiRoutes.currentDomain;
  final String token;

  MainApiConnect({this.token = ""});

  Future<ApiResponse> login(String username, String password) async {
    try {
      final response = await post(
        '$currentDomain/${MainApiRoutes.login}',
        {
          'username': username,
          'password': password,
        },
      );
      final responseBody = jsonDecode(response.bodyString ?? "");
      return ApiResponse.responseFromJson(responseBody);
    } catch (e) {
      return ApiResponse(
        isSuccessful: false,
        error: ApiResponseError(
          code: "error",
          title: "Attention",
          message: e.toString(),
        ),
      );
    }
  }

  Future<ApiResponse> validateToken(String token) async {
    final response = await get(
      '$currentDomain/${MainApiRoutes.validate}',
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    if (response.status.isOk) {
      final responseBody = jsonDecode(response.bodyString ?? "");
      return ApiResponse.responseFromJson(responseBody);
    } else {
      return ApiResponse(
        isSuccessful: false,
        error: ApiResponseError(
          code: "error",
          title: "Attention",
          message: "Quelque chose s'est mal passé",
        ),
      );
    }
  }

  Future<ApiResponse> getREST(String url) async {
    final response = await get(
      url,
      headers: getHeaders(),
    );
    if (response.status.isOk) {
      final responseBody = jsonDecode(response.bodyString ?? "");
      return ApiResponse.responseFromJson(responseBody);
    } else {
      return ApiResponse(
        isSuccessful: false,
        error: ApiResponseError(
          code: "error",
          title: "Attention",
          message: "Quelque chose s'est mal passé",
        ),
      );
    }
  }

  Future<ApiResponse> postREST(String url, Map<String, dynamic> data) async {
    final response = await post(
      url,
      data,
      headers: getHeaders(),
    );
    if (response.status.isOk) {
      final responseBody = jsonDecode(response.bodyString ?? "");
      return ApiResponse.responseFromJson(responseBody);
    } else {
      return ApiResponse(
        isSuccessful: false,
        error: ApiResponseError(
          code: "error",
          title: "Attention",
          message: "Quelque chose s'est mal passé",
        ),
      );
    }
  }

  Map<String, String>? getHeaders() {
    if (token.isNotEmpty) {
      return {
        'Authorization': 'Bearer $token',
      };
    }
    return null;
  }
}

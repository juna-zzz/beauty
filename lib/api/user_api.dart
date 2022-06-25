import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:spaplex/api/http_services.dart';
import '../model/user.dart';
import '../response/login_response.dart';
import '../response/user_response.dart';
import '../utils/url.dart';

class UserApi {
  Future<bool> registerUser(User user) async {
    bool isSignup = false;
    Response response;
    var url = baseUrl + registerUrl;
    var dio = HttpServices().getDioInstance();
    try {
      response = await dio.post(
        url,
        data: user.toJson(),
      );
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return isSignup;
  }

  Future<bool> login(String email, String password) async {
    bool isLogin = false;
    try {
      var url = baseUrl + loginUrl;
      var dio = HttpServices().getDioInstance();

      var response = await dio.post(
        url,
        data: {
          "email": email,
          "password": password,
        },
      );

      if (response.statusCode == 200) {
        LoginResponse loginResponse = LoginResponse.fromJson(response.data);
        token = loginResponse.token;
        isLogin = true;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return isLogin;
  }

  Future<bool> getUser(String email, String username) async {
    try {
      var url = baseUrl + getUserInfo;
      var dio = HttpServices().getDioInstance();

      var response = await dio.get(url,
          options: Options(
            headers: {
              HttpHeaders.authorizationHeader: "Bearer $token",
            },
          ));

      if (response.statusCode == 201) {
        return true;
      }
    } catch (e) {
      throw Exception(e);
    }

    return false;
  }

  Future<UserResponse> userInfo() async {
    Future.delayed(const Duration(seconds: 2), () {});
    UserResponse? userResponse;
    const url = baseUrl + getUserInfo;
    try {
      var dio = HttpServices().getDioInstance();
      Response response = await dio.get(url,
          options: Options(
            headers: {
              HttpHeaders.authorizationHeader: "Bearer $token",
            },
          ));

      if (response.statusCode == 200) {
        userResponse = UserResponse.fromJson(response.data);
      } else {
        userResponse = null;
      }
    } catch (e) {
      throw Exception(e);
    }
    return userResponse!;
  }
}

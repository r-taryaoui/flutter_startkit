import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ma_friperie/api/base/api.response.dart';
import 'package:ma_friperie/api/providers/auth.api.provider.dart';
import 'package:ma_friperie/app/entities/session.dart';
import 'package:ma_friperie/controllers/app.controller.dart';
import 'package:ma_friperie/pages/app/app.holder.dart';

class AppLoginController extends GetxController {
  FocusNode myFocusNode = FocusNode();
  AppLoginController();

  var username = "".obs;
  var password = "".obs;
  var index = 0.obs;

  var showPassword = false.obs;

  var errorMessage = "".obs;

  bool get hasError => errorMessage.value.isNotEmpty;

  setIndex(int i) {
    index.value = i;
  }

  togglePasswordView() {
    showPassword.value = !showPassword.value;
  }

  setUsername(String user) {
    username.value = user;
  }

  setPassword(String pass) {
    password.value = pass;
  }

  submitLoginFom(BuildContext context) async {
    try {
      AppAuthApiProvider provider = AppAuthApiProvider();
      setLoginError("");
      AppSession? session = await provider.generateSessionToken(
        username: username.value,
        password: password.value,
        callback: (ApiResponseError error) {
          setLoginError(error.message);
        },
      );
      if (session != null) {
        AppMainController appMainController = Get.find();
        appMainController.saveSession(session);
        Get.offAndToNamed(AppHolder.routeName);
      }
    } catch (e) {
      log(e.toString());
      setLoginError(e.toString());
    }
  }

  resetLoginFom(BuildContext context) {
    setLoginError("");
  }

  setLoginError(String error) {
    errorMessage.value = error;
  }
}

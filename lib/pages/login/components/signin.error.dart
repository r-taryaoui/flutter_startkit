import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ma_friperie/pages/login/controllers/app.login.controller.dart';

class SignInLoginError extends StatelessWidget {
  const SignInLoginError({super.key});

  @override
  Widget build(BuildContext context) {
    AppLoginController appLoginController = Get.find();

    return Container(
      color: Colors.redAccent,
      margin: const EdgeInsets.fromLTRB(0, 12, 0, 0),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Obx(() => Text(
              appLoginController.errorMessage.value,
              style: const TextStyle(color: Colors.white),
            )),
      ),
    );
  }
}

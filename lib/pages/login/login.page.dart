import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ma_friperie/pages/login/controllers/app.login.controller.dart';
import 'package:ma_friperie/pages/login/layouts/login.mobile.dart';

class AppLoginScreen extends StatelessWidget {
  static const routeName = '/login';

  const AppLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AppLoginController());

    return const AppLoginMobile();
  }
}

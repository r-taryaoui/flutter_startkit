import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ma_friperie/app/entities/user.dart';
import 'package:ma_friperie/controllers/app.controller.dart';

class AppAccountController extends GetxController {
  late AppMainController mainController;
  AppAccountController() {
    mainController = Get.find();
  }

  Rxn<AppUser?> get user => mainController.user;

  AppUser? get currentUser => user.value;

  signout() {
    mainController.signOut(null);
  }

  signin() {
    mainController.signIn(null);
  }

  signup() {
    mainController.signUp(null);
  }

  appReload(BuildContext context) {
    mainController.refreshApp();
  }

  openPictureUploader(BuildContext context,
      {required Function(dynamic asset)? callback}) {}
}

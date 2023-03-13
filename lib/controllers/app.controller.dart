import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ma_friperie/api/providers/auth.api.provider.dart';
import 'package:ma_friperie/api/providers/products.api.provider.dart';
import 'package:ma_friperie/app/entities/product.collection.dart';
import 'package:ma_friperie/app/entities/product.dart';
import 'package:ma_friperie/app/entities/session.dart';
import 'package:ma_friperie/app/entities/user.dart';
import 'package:ma_friperie/controllers/data.service.dart';
import 'package:ma_friperie/pages/login/login.page.dart';
import 'package:ma_friperie/pages/splash/splash.page.dart';

class AppMainController extends GetxController {
  late DataServices dataServices;

  RxString deviceToken = "".obs;

  bool get isConnected => user.value != null;

  Rxn<AppSession?> session = Rxn<AppSession?>();
  Rxn<AppUser?> user = Rxn<AppUser?>();

  var counter = 0.obs;

  AppMainController() {
    dataServices = Get.find();
    refreshApp();
  }

  refreshApp() {
    initToken();
    initCounter();
    initUser();
  }

  Future<AppUser?> initUser() async {
    String? token = await dataServices.getToken();
    if (token != null) {
      AppSession? value = await AppAuthApiProvider().getSession();
      setSession(value);
      return value?.user;
    }
    return null;
  }

  setUser(AppUser? curUser) {
    user.value = curUser;
    notifyChildrens();
  }

  setSession(AppSession? curSession) {
    session.value = curSession;
    if (curSession != null && curSession.user != null) {
      setUser(curSession.user);
    }
    notifyChildrens();
  }

  initToken() {
    dataServices.getToken().then((String? value) => setToken("$value"));
  }

  initCounter() {
    dataServices.loadCounter().then((value) => setCounter(value));
  }

  setToken(String token) {
    deviceToken.value = token;
  }

  incrementCounter() {
    counter++;
  }

  setCounter(int count) {
    counter.value = count;
    notifyChildrens();
  }

  decrementCounter() {
    counter--;
  }

  saveCounter() {
    dataServices.saveCounter(counter.value);
  }

  saveToken() {
    dataServices.saveToken(session.value?.sessionToken);
  }

  saveSession(AppSession? newSession) {
    setSession(newSession);
    saveToken();
  }

  signIn(BuildContext? context) {
    Get.toNamed(AppLoginScreen.routeName);
  }

  signOut(BuildContext? context) {
    dataServices.saveToken(null);
    setUser(null);
    Get.offAndToNamed(AppSplash.routeName);
  }

  signUp(BuildContext? context) {
    //Get.toNamed(AppLogin)
  }

  Future<List<AppProduct>> getProducts({
    String locale = "fr",
    String collection = "top",
  }) async {
    AppProductsApiProvider productsApiProvider = AppProductsApiProvider();
    return productsApiProvider.getProducts(
      locale: locale,
      collection: collection,
    );
  }

  Future<List<AppProductCollection>> getProductsCollection({
    String locale = "fr",
  }) async {
    AppProductsApiProvider productsApiProvider = AppProductsApiProvider();
    return productsApiProvider.getProductsCollections(
      locale: locale,
    );
  }
}

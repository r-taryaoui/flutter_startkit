import 'package:get/get.dart';
import 'package:ma_friperie/api/base/api.connect.dart';
import 'package:ma_friperie/api/base/api.response.dart';
import 'package:ma_friperie/app/entities/session.dart';
import 'package:ma_friperie/app/entities/user.dart';
import 'package:ma_friperie/controllers/app.controller.dart';

class AppAuthApiProvider {
  late AppMainController appController;
  late MainApiConnect mainApiConnect = MainApiConnect();

  AppAuthApiProvider() {
    appController = Get.find();
    appController.dataServices.getToken().then((String? value) {
      if (value != null) {
        mainApiConnect = MainApiConnect(token: value);
      }
    });
  }

  Future<AppSession?> generateSessionToken({
    required String username,
    required String password,
    Function(ApiResponseError error) callback = defaultErrorCallback,
  }) async {
    ApiResponse response = await mainApiConnect.login(username, password);

    if (response.isSuccessful && response.body != null) {
      try {
        return AppSession.createFromResponse(response.body!);
      } catch (e) {
        callback(ApiResponseError(
            code: "error", title: "Attention", message: e.toString()));
      }
    } else if (response.error != null) {
      callback(response.error!);
    }
    return null;
  }

  Future<AppSession?> getSessionByToken({
    String? token,
    Function(ApiResponseError error) callback = defaultErrorCallback,
  }) async {
    ApiResponse response =
        await mainApiConnect.validateToken(token ?? mainApiConnect.token);

    if (response.isSuccessful && response.body != null) {
      try {
        return AppSession.createFromResponse(response.body!);
      } catch (e) {
        callback(ApiResponseError(
            code: "error", title: "Attention", message: e.toString()));
      }
    } else if (response.error != null) {
      callback(response.error!);
    }
    return null;
  }

  Future<AppUser?> getUserByToken({
    String? token,
    Function(ApiResponseError error) callback = defaultErrorCallback,
  }) async {
    AppSession? session =
        await getSessionByToken(token: token, callback: callback);
    return session?.user;
  }

  Future<AppUser?> getUser() async {
    AppUser? user = await getUserByToken(token: mainApiConnect.token);
    appController.setUser(user);
    return user;
  }

  Future<AppSession?> getSession() async {
    AppSession? session = await getSessionByToken(token: mainApiConnect.token);
    appController.setSession(session);
    return session;
  }

  static Future<AppUser?> autoCurrentUser() {
    return AppAuthApiProvider().getUser();
  }

  static Future<AppSession?> autoCurrentSession() {
    return AppAuthApiProvider().getSession();
  }

  static defaultErrorCallback(ApiResponseError error) {
    defaultCallback(
      error.title,
      error.message,
    );
  }

  static defaultCallback(String title, String message) {
    GetSnackBar(
      title: title,
      message: message,
      isDismissible: true,
      duration: const Duration(seconds: 3),
    ).show();
  }
}

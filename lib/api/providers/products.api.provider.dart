import 'package:get/get.dart';
import 'package:ma_friperie/api/base/api.connect.dart';
import 'package:ma_friperie/api/base/api.response.dart';
import 'package:ma_friperie/api/base/routes/api.routes.dart';
import 'package:ma_friperie/app/entities/product.collection.dart';
import 'package:ma_friperie/app/entities/product.dart';
import 'package:ma_friperie/controllers/app.controller.dart';

class AppProductsApiProvider {
  late AppMainController appController;
  late MainApiConnect mainApiConnect = MainApiConnect();

  AppProductsApiProvider() {
    appController = Get.find();
    appController.dataServices.getToken().then((String? value) {
      if (value != null) {
        mainApiConnect = MainApiConnect(token: value);
      }
    });
  }

  Future<ApiResponse> getProductsResponse({
    String locale = "fr",
    String collection = "top",
  }) {
    return mainApiConnect.getREST(
      MainApiRoutes.getProducts(
        locale: locale,
        collection: collection,
      ),
    );
  }

  Future<List<AppProduct>> getProducts({
    String locale = "fr",
    String collection = "top",
    Function(ApiResponseError error) callback = defaultErrorCallback,
  }) async {
    ApiResponse response = await getProductsResponse(
      locale: locale,
      collection: collection,
    );

    if (response.isSuccessful) {
      try {
        return AppProduct.createListFromApiResponse(response.bodyList!);
      } catch (e) {
        callback(
          ApiResponseError(
            code: "error",
            title: "Attention",
            message: e.toString(),
          ),
        );
      }
    } else if (response.error != null) {
      callback(response.error!);
    }
    return [];
  }

  Future<List<AppProductCollection>> getProductsCollections({
    String locale = "fr",
    Function(ApiResponseError error) callback = defaultErrorCallback,
  }) async {
    ApiResponse response = await getProductsResponse(
      locale: locale,
      collection: "collections",
    );

    if (response.isSuccessful) {
      try {
        return AppProductCollection.createListFromApiResponse(
            response.bodyList ?? []);
      } catch (e) {
        callback(
          ApiResponseError(
            code: "error",
            title: "Attention",
            message: e.toString(),
          ),
        );
      }
    } else if (response.error != null) {
      callback(response.error!);
    }
    return [];
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

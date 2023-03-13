import 'package:get/get.dart';
import 'package:ma_friperie/app/entities/product.collection.dart';
import 'package:ma_friperie/app/entities/product.dart';
import 'package:ma_friperie/controllers/app.controller.dart';

class AppHomeController extends GetxController {
  var index = 0.obs;

  var isLoadingCollections = false.obs;
  var isLoadingCards = false.obs;
  var isLoadingTopCards = false.obs;
  var isLoadingLastCards = false.obs;

  Rxn<List<AppProduct>> listProducts = Rxn<List<AppProduct>>();
  Rxn<List<AppProduct>> listTopProducts = Rxn<List<AppProduct>>();
  Rxn<List<AppProduct>> listLastProducts = Rxn<List<AppProduct>>();

  Rxn<List<AppProductCollection>> listCollections =
      Rxn<List<AppProductCollection>>();
  //var listCollections = [].obs;

  AppHomeController() {
    setProducts([]);
    setCollections([]);

    getProducts();
    getProductsCollections();
  }
  setIndex(int i) {
    index.value = i;
  }

  setProducts(List<AppProduct> list) {
    listProducts.value = list;
    isLoadingCards.value = false;
    notifyChildrens();
  }

  setTopProducts(List<AppProduct> list) {
    listTopProducts.value = list;
    isLoadingTopCards.value = false;
    notifyChildrens();
  }

  setLastProducts(List<AppProduct> list) {
    listLastProducts.value = list;
    isLoadingLastCards.value = false;
    notifyChildrens();
  }

  setCollections(List<AppProductCollection> list) {
    listCollections.value = list;
    isLoadingCollections.value = false;
    notifyChildrens();
  }

  mockLoading() {
    startLoading();
    Future.delayed(const Duration(seconds: 2)).then((value) => stopLoading());
  }

  Future<List<AppProduct>> getProductsList({
    String locale = "fr",
    String collection = "top",
  }) async {
    AppMainController mainController = Get.find();
    return mainController.getProducts(
      locale: locale,
      collection: collection,
    );
  }

  getProducts({
    String locale = "fr",
    String collection = "top",
  }) {
    startLoading();
    getProductsList(
      locale: locale,
      collection: collection,
    )
        .then(
          (List<AppProduct> list) => setProducts(list),
        )
        .whenComplete(() => stopLoading());
  }

  getTopProducts({
    String locale = "fr",
  }) {
    startTopLoading();
    getProductsList(
      locale: locale,
      collection: "top",
    )
        .then(
          (List<AppProduct> list) => setTopProducts(list),
        )
        .whenComplete(() => stopTopLoading());
  }

  getLastProducts({
    String locale = "fr",
  }) {
    startLastLoading();
    getProductsList(
      locale: locale,
      collection: "last",
    )
        .then(
          (List<AppProduct> list) => setLastProducts(list),
        )
        .whenComplete(() => stopLastLoading());
  }

  getProductsCollections({
    String locale = "fr",
  }) {
    AppMainController mainController = Get.find();
    startLoadingCollections();
    mainController
        .getProductsCollection(
          locale: locale,
        )
        .then(
          (List<AppProductCollection> list) => setCollections(list),
        )
        .whenComplete(() => stopLoadingCollections());
  }

  startLoadingCollections() {
    isLoadingCollections.value = true;
    notifyChildrens();
  }

  stopLoadingCollections() {
    isLoadingCollections.value = false;
    notifyChildrens();
  }

  startLoading() {
    isLoadingCards.value = true;
    notifyChildrens();
  }

  stopLoading() {
    isLoadingCards.value = false;
    notifyChildrens();
  }

  startTopLoading() {
    isLoadingTopCards.value = true;
    notifyChildrens();
  }

  stopTopLoading() {
    isLoadingTopCards.value = false;
    notifyChildrens();
  }

  startLastLoading() {
    isLoadingLastCards.value = true;
    notifyChildrens();
  }

  stopLastLoading() {
    isLoadingLastCards.value = false;
    notifyChildrens();
  }
}

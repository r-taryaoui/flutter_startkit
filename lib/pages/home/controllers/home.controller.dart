import 'package:get/get.dart';

class AppHomeController extends GetxController {
  var index = 0.obs;

  var isLoadingCards = false.obs;

  setIndex(int i) {
    index.value = i;
  }

  mockLoading() {
    startLoading();
    Future.delayed(const Duration(seconds: 2)).then((value) => stopLoading());
  }

  startLoading() {
    isLoadingCards.value = true;
    notifyChildrens();
  }

  stopLoading() {
    isLoadingCards.value = false;
    notifyChildrens();
  }
}

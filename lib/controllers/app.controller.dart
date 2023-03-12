import 'package:get/get.dart';
import 'package:ma_friperie/app/entities/user.dart';
import 'package:ma_friperie/controllers/data.service.dart';

class AppMainController extends GetxController {
  late DataServices dataServices;

  RxString deviceToken = "".obs;

  bool get isConnected => user.value != null;

  Rxn<AppUser?> user = Rxn<AppUser?>();

  var counter = 0.obs;

  AppMainController() {
    dataServices = Get.find();
    //initUser();
    initCounter();
  }

  initUser() {
    user.value = AppUser();
    notifyChildrens();
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
}

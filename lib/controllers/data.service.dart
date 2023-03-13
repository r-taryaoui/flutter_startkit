import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';

class DataServices extends GetxService {
  Future<DataServices> init() async {
    await GetStorage.init();
    return this;
  }

  Future<void> saveCounter(int counter) async {
    GetStorage().write("counter", counter);
  }

  Future<int> loadCounter() async {
    return int.tryParse(GetStorage().read("counter").toString()) ?? 0;
  }

  Future<void> saveToken(String? token) async {
    GetStorage().write("token", token);
  }

  Future<String?> getToken() async {
    return GetStorage().read("token")?.toString();
  }
}

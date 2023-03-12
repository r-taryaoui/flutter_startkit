import 'package:get/get.dart';
import 'package:ma_friperie/app/wrappers/app.chat.structure.dart';

class AppMarketController extends GetxController {
  var searchQuery = "".obs;

  Rxn<List<AppChatStructure>> chatList = Rxn<List<AppChatStructure>>();

  List<AppChatStructure> get filteredChatList {
    if (searchQuery.isEmpty) return chatList.value ?? [];
    return chatList.value
            ?.where((element) => element.containsText(searchQuery.value))
            .toList() ??
        [];
  }

  AppMarketController() {
    List<AppChatStructure> items = AppChatStructure.getSamples();
    setChatList(items);
  }

  setSearchQuery(String i) {
    searchQuery.value = i;
  }

  setChatList(List<AppChatStructure> items) {
    chatList.value = items;
    notifyChildrens();
  }
}

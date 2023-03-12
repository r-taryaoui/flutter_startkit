import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ma_friperie/app/wrappers/app.page.structure.dart';

class AppHolderController extends GetxController {
  var index = 0.obs;

  setIndex(int i) {
    index.value = i;
  }

  List<AppPageStructure> getMobilePages(BuildContext context) {
    return getPages(context).where((element) => element.showOnMobile).toList();
  }

  List<AppPageStructure> getDesktopPages(BuildContext context) {
    return getPages(context)
        .where((element) => element.showOnNavigation)
        .toList();
  }

  List<AppPageStructure> getPages(BuildContext context) {
    return AppPageStructure.getAllPages(context);
  }

  List<IconData> getIcons(BuildContext context) {
    List<IconData> icons = [];
    for (AppPageStructure page in getPages(context)) {
      icons.add(page.icon);
    }
    return icons;
  }
}

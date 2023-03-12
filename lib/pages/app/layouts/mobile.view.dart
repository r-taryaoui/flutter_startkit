import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ma_friperie/app/libraries/theme.dart';
import 'package:ma_friperie/app/wrappers/app.page.structure.dart';
import 'package:ma_friperie/pages/app/controllers/app.holder.controller.dart';

class MainViewMobile extends StatelessWidget {
  const MainViewMobile({super.key});

  @override
  Widget build(BuildContext context) {
    AppHolderController appHolderController = Get.find();
    List<AppPageStructure> pages = appHolderController.getMobilePages(context);
    return Obx(
      () => Scaffold(
        body: pages.elementAt(appHolderController.index.value).widget,
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: AppGlobalTheme.primaryColor,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 14,
          unselectedFontSize: 14,
          onTap: appHolderController.setIndex,
          currentIndex: appHolderController.index.value,
          items: [
            for (AppPageStructure page in pages)
              BottomNavigationBarItem(
                label: page.title,
                icon: Icon(page.icon),
              ),
          ],
        ),
      ),
    );
  }
}

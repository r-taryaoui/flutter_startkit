import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ma_friperie/app/libraries/constants.dart';
import 'package:ma_friperie/app/libraries/theme.dart';
import 'package:ma_friperie/app/wrappers/app.page.structure.dart';
import 'package:ma_friperie/controllers/app.controller.dart';
import 'package:ma_friperie/pages/app/controllers/app.holder.controller.dart';
import 'package:side_navigation/side_navigation.dart';

class MainViewDesktop extends StatelessWidget {
  const MainViewDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    AppHolderController appHolderController = Get.find();
    AppMainController appController = Get.find();
    List<AppPageStructure> pages = appHolderController.getDesktopPages(context);
    return Scaffold(
      body: Obx(
        () => Row(
          children: [
            SideNavigationBar(
              theme: SideNavigationBarTheme(
                togglerTheme: const SideNavigationBarTogglerTheme(
                  expandIconColor: AppGlobalTheme.primaryColor,
                  shrinkIconColor: AppGlobalTheme.primaryColor,
                ),
                itemTheme: SideNavigationBarItemTheme(
                  selectedItemColor: AppGlobalTheme.primaryColor,
                ),
                dividerTheme: const SideNavigationBarDividerTheme(
                  showHeaderDivider: true,
                  showMainDivider: true,
                  showFooterDivider: true,
                ),
              ),
              selectedIndex: appHolderController.index.value,
              onTap: (int index) {
                if (pages.elementAt(index).showOnMobile) {
                  appHolderController.setIndex(index);
                } else {
                  Get.to(() => pages.elementAt(index).widget);
                }
              },
              header: SideNavigationBarHeader(
                image: SizedBox(
                  width: 180,
                  child: SvgPicture.asset(
                    AppConstants.logoSvg,
                    height: 40,
                  ),
                ),
                title: const SizedBox(width: 0, height: 0),
                subtitle: const SizedBox(width: 0, height: 0),
              ),
              items: [
                for (AppPageStructure page in pages)
                  SideNavigationBarItem(
                    icon: page.icon,
                    label: page.title,
                  ),
              ],
              footer: SideNavigationBarFooter(
                label: TextButton(
                  onPressed: () {
                    if (appController.isConnected) {
                      appController.signOut(context);
                    } else {
                      appController.signIn(context);
                    }
                  },
                  child: Row(
                    children: [
                      Obx(
                        () => Icon(appController.isConnected
                            ? Icons.logout
                            : Icons.login),
                      ),
                      const SizedBox(width: 14),
                      Obx(() => Text(appController.isConnected
                          ? 'Se deconnecter'
                          : 'Se Connecter')),
                    ],
                  ),
                ),
              ),
              toggler: SideBarToggler(
                expandIcon: Icons.keyboard_arrow_right,
                shrinkIcon: Icons.keyboard_arrow_left,
                onToggle: () {
                  log('Toggle');
                },
              ),
            ),
            Expanded(
              child: SafeArea(
                  child:
                      pages.elementAt(appHolderController.index.value).widget),
            )
          ],
        ),
      ),
    );
  }
}

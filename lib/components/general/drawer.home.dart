import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ma_friperie/app/libraries/constants.dart';
import 'package:ma_friperie/app/libraries/theme.dart';
import 'package:ma_friperie/controllers/app.controller.dart';
import 'package:ma_friperie/pages/app/controllers/app.holder.controller.dart';

class AppHomeDrawer extends StatelessWidget {
  const AppHomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    AppMainController appController = Get.find();
    AppHolderController holderController = Get.find();
    return Drawer(
      elevation: 2,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: AppGlobalTheme.primaryColor,
                padding: const EdgeInsets.all(14),
                child: SvgPicture.asset(
                  AppConstants.logoSvgWhite,
                  height: 80,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Obx(
                  () => Text(
                      "Bonjour ${appController.isConnected ? appController.user.value?.fullName : ''} chez ${AppConstants.appName}"),
                ),
              ),
              for (var page in holderController.getDesktopPages(context))
                ListTile(
                  onTap: () {
                    bool opened = false;
                    if (page.showOnMobile &&
                        holderController
                            .getMobilePages(context)
                            .contains(page)) {
                      for (int i = 0;
                          i < holderController.getMobilePages(context).length;
                          i++) {
                        if (holderController
                                .getMobilePages(context)
                                .elementAt(i) ==
                            page) {
                          holderController.setIndex(i);
                          opened = true;
                        }
                      }
                    }
                    if (!opened) {
                      Get.to(() => page.widget);
                    }
                  },
                  leading: Icon(page.icon),
                  title: Text(page.title),
                  trailing: const Icon(Icons.chevron_right),
                ),
              const SizedBox(height: 12),
              Obx(
                () => appController.isConnected
                    ? ListTile(
                        onTap: () {},
                        leading: const Icon(Icons.logout),
                        title: const Text("Se Déconnecter"),
                        trailing: const Icon(Icons.chevron_right),
                      )
                    : ListTile(
                        onTap: () {},
                        leading: const Icon(Icons.login),
                        title: const Text("Se Connecter"),
                        trailing: const Icon(Icons.chevron_right),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

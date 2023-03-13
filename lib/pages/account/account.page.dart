import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ma_friperie/app/libraries/theme.dart';
import 'package:ma_friperie/controllers/app.controller.dart';
import 'package:ma_friperie/pages/account/controllers/app.account.controller.dart';

class AppAccountPageView extends StatefulWidget {
  static const routeName = '/compte';

  const AppAccountPageView({super.key});

  @override
  State<AppAccountPageView> createState() => _AppAccountPageViewState();
}

class _AppAccountPageViewState extends State<AppAccountPageView> {
  AppAccountController accountController = AppAccountController();
  AppMainController appMainController = Get.find();
  @override
  void initState() {
    Get.put(accountController);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mon compte"),
        actions: [
          getActionsMenu(context),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Obx(
            () => (accountController.user.value != null)
                ? buildUserTiles(context)
                : buildGuestTiles(context),
          ),
        ),
      ),
    );
  }

  Widget buildUserTiles(BuildContext context) {
    if (accountController.currentUser == null) {
      return buildGuestTiles(context);
    }

    return Obx(
      () => Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 22),
          GestureDetector(
            onTap: () {
              accountController.openPictureUploader(
                context,
                callback: (dynamic asset) {},
              );
            },
            child: CircleAvatar(
              minRadius: 44,
              maxRadius: 80,
              backgroundColor: AppGlobalTheme.primaryColor,
              child: ClipOval(
                child: accountController.user.value != null
                    ? Image.network(
                        "${accountController.user.value?.picture}",
                        height: 180,
                        width: 180,
                        fit: BoxFit.cover,
                      )
                    : const Icon(
                        Icons.account_circle,
                        size: 160,
                      ),
              ),
            ),
          ),
          const SizedBox(height: 22),
          Text(
            "${accountController.user.value?.fullName}",
            style: const TextStyle(fontSize: 28),
          ),
          const SizedBox(height: 22),
          ListTile(
            tileColor: AppGlobalTheme.getThemeBackgroundColor(context),
            title: const Text("Type"),
            trailing: Text("${accountController.user.value?.type}"),
          ),
          const SizedBox(height: 8),
          ListTile(
            tileColor: AppGlobalTheme.getThemeBackgroundColor(context),
            title: const Text("Identifiant"),
            trailing: Text("@${accountController.user.value?.username}"),
          ),
          const SizedBox(height: 8),
          ListTile(
            tileColor: AppGlobalTheme.getThemeBackgroundColor(context),
            title: const Text("Nom"),
            trailing: Text("${accountController.user.value?.lastName}"),
          ),
          const SizedBox(height: 8),
          ListTile(
            tileColor: AppGlobalTheme.getThemeBackgroundColor(context),
            title: const Text("Prénom"),
            trailing: Text("${accountController.user.value?.firstName}"),
          ),
          const SizedBox(height: 8),
          ListTile(
            tileColor: AppGlobalTheme.getThemeBackgroundColor(context),
            title: const Text("Télephone"),
            trailing: Text("${accountController.user.value?.phone}"),
          ),
          const SizedBox(height: 8),
          ListTile(
            tileColor: AppGlobalTheme.getThemeBackgroundColor(context),
            title: const Text("Email"),
            trailing: Text("${accountController.user.value?.email}"),
          ),
          const SizedBox(height: 22),
          ListTile(
            onTap: () {
              appMainController.refreshApp();
              Get.snackbar(
                  "Actualisation", "Actualisation d'application en cours");
            },
            leading: const Icon(Icons.refresh),
            tileColor: AppGlobalTheme.getThemeBackgroundColor(context),
            title: const Text("Actualiser l'application"),
          ),
          const SizedBox(height: 8),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.edit_notifications_outlined),
            tileColor: AppGlobalTheme.getThemeBackgroundColor(context),
            title: const Text("Actualiser les notifications"),
          ),
          const SizedBox(height: 8),
          const SizedBox(height: 22),
          ListTile(
            onTap: accountController.signout,
            leading: const Icon(Icons.logout),
            tileColor: AppGlobalTheme.getThemeBackgroundColor(context),
            title: const Text("Se deconnecter"),
            trailing: const Icon(
              Icons.chevron_right,
            ),
          ),
          const SizedBox(height: 22),
        ],
      ),
    );
  }

  Widget buildGuestTiles(BuildContext context) {
    if (accountController.currentUser != null) {
      return buildUserTiles(context);
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 22),
        GestureDetector(
          onTap: () {
            accountController.openPictureUploader(
              context,
              callback: (dynamic asset) {},
            );
          },
          child: const CircleAvatar(
            minRadius: 44,
            maxRadius: 80,
            backgroundColor: AppGlobalTheme.primaryColor,
            child: ClipOval(
              child: Icon(
                Icons.account_circle,
                size: 160,
              ),
            ),
          ),
        ),
        const SizedBox(height: 22),
        const Text(
          "Vous n'etes pas connecter",
          style: TextStyle(fontSize: 28),
        ),
        const SizedBox(height: 22),
        ListTile(
          onTap: accountController.signin,
          leading: const Icon(Icons.logout),
          tileColor: AppGlobalTheme.getThemeBackgroundColor(context),
          title: const Text("Se Connecter"),
          trailing: const Icon(
            Icons.chevron_right,
          ),
        ),
        ListTile(
          onTap: accountController.signup,
          leading: const Icon(Icons.camera_front_rounded),
          tileColor: AppGlobalTheme.getThemeBackgroundColor(context),
          title: const Text("S'inscrire"),
          trailing: const Icon(
            Icons.chevron_right,
          ),
        ),
        const SizedBox(height: 22),
        ListTile(
          onTap: () {
            appMainController.refreshApp();
            Get.snackbar(
                "Actualisation", "Actualisation d'application en cours");
          },
          leading: const Icon(Icons.refresh),
          tileColor: AppGlobalTheme.getThemeBackgroundColor(context),
          title: const Text("Actualiser l'application"),
        ),
        const SizedBox(height: 22),
      ],
    );
  }

  Widget getActionsMenu(BuildContext context) {
    AppAccountController appController = Get.find();
    return PopupMenuButton<String>(
      itemBuilder: (context) => [
        const PopupMenuDivider(height: 2),
        PopupMenuItem(
          value: "refresh",
          child: Row(
            children: [
              Icon(
                Icons.refresh,
                color: AppGlobalTheme.getThemeColor(context),
              ),
              const SizedBox(width: 22),
              const Text("Actualiser")
            ],
          ),
        ),
        PopupMenuItem(
          value: "photo",
          child: Row(
            children: [
              Icon(
                Icons.add_a_photo,
                color: AppGlobalTheme.getThemeColor(context),
              ),
              const SizedBox(width: 22),
              const Text("Changer la photo")
            ],
          ),
        ),
      ],
      color: AppGlobalTheme.textBackground,
      elevation: 2,
      onSelected: (value) {
        if (kDebugMode) {
          print('selected : $value');
        }
        switch (value) {
          case "refresh":
            appController.appReload(context);
            Get.snackbar(
              "Actualisation",
              "Actualisation d'application en cours",
            );
            break;
          case "photo":
            appController.openPictureUploader(context,
                callback: ((asset) => appController.appReload(context)));
            break;
          default:
        }
      },
    );
  }

  showNotificationsToken(BuildContext context, String token) {}
}

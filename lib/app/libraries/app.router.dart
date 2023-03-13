import 'package:get/route_manager.dart';
import 'package:ma_friperie/pages/account/account.page.dart';
import 'package:ma_friperie/pages/app/app.holder.dart';
import 'package:ma_friperie/pages/chat/chat.page.dart';
import 'package:ma_friperie/pages/home/home.page.dart';
import 'package:ma_friperie/pages/login/login.page.dart';
import 'package:ma_friperie/pages/market/market.page.dart';
import 'package:ma_friperie/pages/splash/splash.page.dart';

class AppRouter {
  static String initialRoute = AppSplash.routeName;
  static List<GetPage> getPages() {
    return [
      GetPage(
        name: AppSplash.routeName,
        page: () => const AppSplash(),
      ),
      GetPage(
        name: AppHolder.routeName,
        page: () => const AppHolder(),
      ),
      GetPage(
        name: AppHomePage.routeName,
        page: () => const AppHomePage(),
      ),
      GetPage(
        name: AppMarketPage.routeName,
        page: () => const AppMarketPage(),
      ),
      GetPage(
        name: AppChatPage.routeName,
        page: () => const AppChatPage(),
      ),
      GetPage(
        name: AppAccountPageView.routeName,
        page: () => const AppAccountPageView(),
      ),
      GetPage(
        name: AppLoginScreen.routeName,
        page: () => const AppLoginScreen(),
      ),
      //
    ];
  }
}

import 'package:flutter/material.dart';
import 'package:ma_friperie/pages/account/account.page.dart';
import 'package:ma_friperie/pages/chat/chat.page.dart';
import 'package:ma_friperie/pages/home/home.page.dart';
import 'package:ma_friperie/pages/market/market.page.dart';

class AppPageStructure {
  final IconData icon;
  final String title;
  final Widget widget;
  final bool showOnNavigation;
  final bool showOnMobile;
  AppPageStructure({
    required this.icon,
    required this.title,
    required this.widget,
    this.showOnNavigation = true,
    this.showOnMobile = true,
  });

  @override
  bool operator ==(Object other) {
    return (other is AppPageStructure && title == other.title) ||
        (other is Widget && other == widget);
  }

  @override
  int get hashCode => title.hashCode;

  @override
  String toString() => title;

  static List<AppPageStructure> getAllPages(BuildContext context) {
    List<AppPageStructure> pages = [];
    pages.add(AppPageStructure(
      icon: Icons.dashboard,
      title: "Dashboard",
      widget: const AppHomePage(),
    ));
    pages.add(AppPageStructure(
      icon: Icons.search,
      title: "Rechercher",
      widget: const AppMarketPage(),
    ));
    pages.add(AppPageStructure(
      icon: Icons.chat_rounded,
      title: "Messages",
      widget: const AppChatPage(),
    ));
    pages.add(
      AppPageStructure(
        icon: Icons.person,
        title: "Account",
        widget: const AppAccountPageView(),
      ),
    );
    pages.add(
      AppPageStructure(
          icon: Icons.history,
          title: "Mes achats",
          widget: const AppHomePage(),
          showOnMobile: false),
    );
    return pages;
  }
}

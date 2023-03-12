import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ma_friperie/app/libraries/theme.dart';
import 'package:ma_friperie/pages/app/controllers/app.holder.controller.dart';
import 'package:ma_friperie/pages/app/layouts/desktop.view.dart';
import 'package:ma_friperie/pages/app/layouts/mobile.view.dart';

class AppHolder extends StatefulWidget {
  static const routeName = '/home';

  const AppHolder({super.key});

  @override
  State<AppHolder> createState() => _AppHolderState();
}

class _AppHolderState extends State<AppHolder> {
  @override
  void initState() {
    Get.put(AppHolderController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width > AppGlobalTheme.breakPoint) {
      return const MainViewDesktop();
    }
    return const MainViewMobile();
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ma_friperie/app/libraries/app.router.dart';
import 'package:ma_friperie/app/libraries/theme.dart';
import 'package:ma_friperie/controllers/app.controller.dart';
import 'package:ma_friperie/controllers/data.service.dart';

Future<void> initServices() async {
  await Get.putAsync(() => DataServices().init());
  Get.put(AppMainController());
}

Future<void> main() async {
  await initServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ma friperie',
      theme: AppGlobalTheme.getMaterialThemeData(context),
      darkTheme: AppGlobalTheme.getMaterialDarkThemeData(context),
      initialRoute: AppRouter.initialRoute,
      getPages: AppRouter.getPages(),
    );
  }
}

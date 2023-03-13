import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ma_friperie/app/libraries/constants.dart';
import 'package:ma_friperie/app/libraries/theme.dart';
import 'package:ma_friperie/components/general/drawer.home.dart';
import 'package:ma_friperie/pages/home/components/cards/products.collections.list.card.dart';
import 'package:ma_friperie/pages/home/components/cards/products.last.list.card.dart';
import 'package:ma_friperie/pages/home/components/cards/products.list.card.dart';
import 'package:ma_friperie/pages/home/components/cards/products.top.list.card.dart';
import 'package:ma_friperie/pages/home/controllers/home.controller.dart';

class AppHomePage extends StatefulWidget {
  static const routeName = '/dashboard';

  const AppHomePage({super.key});

  @override
  State<AppHomePage> createState() => _AppHomePageState();
}

class _AppHomePageState extends State<AppHomePage> {
  @override
  void initState() {
    Get.put(AppHomeController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool onSmallView =
        MediaQuery.of(context).size.width <= AppGlobalTheme.breakPoint;
    return Scaffold(
      appBar: AppBar(
        centerTitle: onSmallView,
        title: onSmallView
            ? SvgPicture.asset(AppConstants.logoSvg, height: 40)
            : const Text('Dashboard'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.shopping_cart),
            ),
          ),
        ],
      ),
      drawer: onSmallView ? const AppHomeDrawer() : null,
      body: SingleChildScrollView(
        child: Column(
          children: const [
            AppProductsCollectionsCard(),
            AppProductsListCard(),
            AppTopProductsListCard(),
            AppLastProductsListCard(),
          ],
        ),
      ),
    );
  }

  Widget? buildDrawer(BuildContext context) {
    return (MediaQuery.of(context).size.width <= AppGlobalTheme.breakPoint)
        ? const AppHomeDrawer()
        : null;
  }

  Widget? buildTitle(BuildContext context) {
    return (MediaQuery.of(context).size.width <= AppGlobalTheme.breakPoint)
        ? SvgPicture.asset(
            AppConstants.logoSvg,
            height: 40,
          )
        : const Text('Dashboard');
  }
}

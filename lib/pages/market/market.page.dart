import 'package:flutter/material.dart';
import 'package:ma_friperie/app/libraries/theme.dart';
import 'package:ma_friperie/components/general/drawer.home.dart';
import 'package:ma_friperie/tests/counter.test.page.dart';

class AppMarketPage extends StatelessWidget {
  static const routeName = '/search';
  const AppMarketPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle:
            MediaQuery.of(context).size.width <= AppGlobalTheme.breakPoint,
        title: const Text('Rechercher'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.shopping_cart),
            ),
          )
        ],
      ),
      drawer: buildDrawer(context),
      body: const MyHomePage(),
    );
  }

  Widget? buildDrawer(BuildContext context) {
    return (MediaQuery.of(context).size.width <= AppGlobalTheme.breakPoint)
        ? const AppHomeDrawer()
        : null;
  }
}

import 'package:flutter/material.dart';
import 'package:ma_friperie/app/entities/product.collection.dart';
import 'package:ma_friperie/app/libraries/theme.dart';

class AppProductCollectionViewCard extends StatelessWidget {
  final Color color;
  final AppProductCollection? productCollection;
  const AppProductCollectionViewCard(
      {super.key,
      this.productCollection,
      this.color = AppGlobalTheme.primaryColor});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Container(
        color: color.withOpacity(0.2),
        height: 180,
        width: 300,
        child: Stack(
          children: [
            if ((productCollection != null &&
                productCollection?.background != null))
              Positioned(
                top: 0,
                left: 0,
                child: SizedBox(
                  height: 180,
                  width: 300,
                  child: Image(
                    image: NetworkImage(
                      productCollection!.backgroundURL!,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                color: Colors.black.withOpacity(0.6),
                height: 180,
                width: 300,
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: SizedBox(
                height: 180,
                width: 300,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      productCollection?.title ?? 'Collection Test',
                      style: const TextStyle(
                        color: AppGlobalTheme.primaryColorContrast,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      productCollection?.safeDescription ??
                          "Ceci est un test de visualisation",
                      style: const TextStyle(
                        color: AppGlobalTheme.primaryColorContrast,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //FastCachedImage(url: productCollection!.backgroundURL!),
          ],
        ),
      ),
    );
  }

  static List<Widget> buildLoadingList(BuildContext context) {
    return [
      const AppProductCollectionViewCard(color: Colors.black),
      const AppProductCollectionViewCard(color: Colors.black),
      const AppProductCollectionViewCard(color: Colors.black),
      const AppProductCollectionViewCard(color: Colors.black),
    ];
  }

  static List<Widget> buildSampleList(BuildContext context) {
    return [
      const AppProductCollectionViewCard(color: Colors.amber),
      const AppProductCollectionViewCard(color: Colors.red),
      const AppProductCollectionViewCard(color: Colors.blue),
      const AppProductCollectionViewCard(color: Colors.green),
    ];
  }

  static List<Widget> buildList(
      BuildContext context, List<AppProductCollection> list) {
    return [
      for (AppProductCollection item in list)
        AppProductCollectionViewCard(
          productCollection: item,
        ),
    ];
  }
}

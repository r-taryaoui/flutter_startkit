import 'package:flutter/material.dart';
import 'package:ma_friperie/app/entities/product.dart';

class AppProductViewCard extends StatelessWidget {
  final AppProduct? product;
  final Color color;
  const AppProductViewCard(
      {super.key, this.product, this.color = Colors.amber});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 280,
              width: 200,
              child: (product != null && product?.picture != null)
                  ? Image(
                      image: NetworkImage(
                        product!.picture!.fullPath,
                      ),
                      fit: BoxFit.cover,
                    )
                  : Container(
                      color: color,
                      height: 280,
                      width: 200,
                      child: const Center(child: Text("Aucune Image")),
                    ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            product?.title ?? 'Produit Test',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: 200,
            child: ElevatedButton(
                onPressed: () {}, child: const Text('voir détails')),
          ),
        ],
      ),
    );
  }

  static List<Widget> buildLoadingList(BuildContext context) {
    return [
      const AppProductViewCard(color: Colors.black),
      const AppProductViewCard(color: Colors.black),
      const AppProductViewCard(color: Colors.black),
      const AppProductViewCard(color: Colors.black),
    ];
  }

  static List<Widget> buildSampleList(BuildContext context) {
    return [
      const AppProductViewCard(color: Colors.amber),
      const AppProductViewCard(color: Colors.red),
      const AppProductViewCard(color: Colors.blue),
      const AppProductViewCard(color: Colors.green),
    ];
  }

  static List<Widget> buildList(
      BuildContext context, List<AppProduct> products) {
    return [
      for (AppProduct product in products)
        AppProductViewCard(
          product: product,
        ),
    ];
  }
}

import 'package:flutter/material.dart';

class AppProductViewCard extends StatelessWidget {
  final Color color;
  const AppProductViewCard({super.key, this.color = Colors.amber});

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
            child: Container(
              color: color,
              height: 280,
              width: 200,
              child: const Center(child: Text("#image_ici")),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Produit Test',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text("détails test de produits"),
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
}

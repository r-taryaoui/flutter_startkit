import 'package:flutter/material.dart';

class AppProductCollectionViewCard extends StatelessWidget {
  final Color color;
  const AppProductCollectionViewCard({super.key, this.color = Colors.amber});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Container(
        color: color,
        height: 180,
        width: 300,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text(
              'Collection Test',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text("Ceci est un test de visualisation"),
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
}

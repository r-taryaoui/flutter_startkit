import 'package:flutter/material.dart';

class StaticLine extends StatelessWidget {
  final String title;
  final double lineWidth;
  const StaticLine({super.key, required this.title, this.lineWidth = 60});

  Widget buildLine(BuildContext context) {
    return Container(
      width: lineWidth,
      height: 6,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.blue,
            width: 3.0,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildLine(context),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            title,
            style: const TextStyle(color: Colors.blue, fontSize: 18),
          ),
        ),
        const Spacer(),
        buildLine(context),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ma_friperie/app/libraries/theme.dart';

class AppTitledCard extends StatelessWidget {
  final String title;
  final Widget? action;
  final Widget? child;
  const AppTitledCard(
      {super.key, required this.title, this.action, this.child});

  @override
  Widget build(BuildContext context) {
    final Text titleText = Text(
      title,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: AppGlobalTheme.getThemeColor(context),
      ),
    );
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          (action != null)
              ? Row(
                  children: [
                    titleText,
                    const Spacer(),
                    action ?? const SizedBox()
                  ],
                )
              : titleText,
          const SizedBox(height: 8),
          Container(
            child: child,
          )
        ],
      ),
    );
  }
}

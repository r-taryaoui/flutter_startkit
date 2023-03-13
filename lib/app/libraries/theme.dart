import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppGlobalTheme {
  static bool get isCupertino => GetPlatform.isIOS || GetPlatform.isMacOS;
  static bool get isMaterial => !isCupertino;
  static bool get isWeb => GetPlatform.isWeb;

  static const MaterialColor primaryColor = Colors.orange;
  static const MaterialColor secondaryColor = Colors.red;

  static const Color primaryColorContrast = Colors.white;
  static const Color secondaryColorContrast = Colors.white;

  static const Color textColor = Colors.black;
  static const Color textBackground = Colors.white;
  static Color textSecondaryBackground = Colors.grey.shade300;
  static Color textSecondaryBackgroundDarker = Colors.grey.shade600;
  static Color secondaryBackground = Colors.grey.shade800;
  static Color secondaryBackgroundDarker = Colors.black;
  static Color textSecondaryColor = Colors.black87;

  static const double breakPoint = 800;
  static const double secondBreakPoint = 1200;

  static const bigTitleStyle = TextStyle(
    fontSize: 44,
    fontWeight: FontWeight.bold,
  );

  static const bigTitleStyle2 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
  );

  static const bigTitleStyle3 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
  );

  static const h1Style = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static const h2Style = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static const h3Style = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static const h4Style = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );

  static const smallText = TextStyle(
    fontSize: 12,
  );

  static ThemeData getMaterialThemeData(BuildContext context) {
    return ThemeData(
      //useMaterial3: true,
      primarySwatch: primaryColor,
      brightness: Brightness.light,
    );
  }

  static CupertinoThemeData getCupertinoThemeData(BuildContext context) {
    return const CupertinoThemeData(
      primaryColor: primaryColor,
    );
  }

  static ThemeData getMaterialDarkThemeData(BuildContext context) {
    return ThemeData(
      primarySwatch: primaryColor,
      brightness: Brightness.dark,
      primaryColorDark: primaryColor,
      textTheme: Theme.of(context).textTheme.apply(
            bodyColor: textBackground,
            displayColor: textBackground,
          ),
    );
  }

  static Color getThemeColor(BuildContext context) {
    return MediaQuery.of(context).platformBrightness == Brightness.light
        ? textColor
        : textBackground;
  }

  static Color getThemeBackgroundColor(BuildContext context) {
    return MediaQuery.of(context).platformBrightness == Brightness.light
        ? textBackground
        : textColor;
  }

  static Color getThemeSecondaryBackgroundColor(BuildContext context) {
    return MediaQuery.of(context).platformBrightness == Brightness.light
        ? textSecondaryBackground
        : secondaryBackground;
  }

  static Color getThemeSecondaryBackgroundColorDarker(BuildContext context) {
    return MediaQuery.of(context).platformBrightness == Brightness.light
        ? textSecondaryBackgroundDarker
        : secondaryBackgroundDarker;
  }

  static Color getIconColor(BuildContext context) {
    return MediaQuery.of(context).platformBrightness == Brightness.light
        ? Colors.blueGrey
        : Colors.blueGrey.shade200;
  }
}

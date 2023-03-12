import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ma_friperie/app/libraries/theme.dart';

class AppTextButton extends StatelessWidget {
  final Function()? onPressed;
  final Widget child;

  const AppTextButton({
    super.key,
    required this.child,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    if (AppGlobalTheme.isCupertino) {
      return cupertinoButton(context);
    }
    return materialButton(context);
  }

  Widget cupertinoButton(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      child: child,
    );
  }

  Widget materialButton(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: child,
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ma_friperie/app/libraries/theme.dart';
import 'package:ma_friperie/components/buttons/text.button.dart';

class AppTextIconButton extends StatelessWidget {
  final Function()? onPressed;
  final String title;
  final Widget icon;
  final bool hideTextOnMobile;

  const AppTextIconButton({
    super.key,
    this.onPressed,
    required this.title,
    required this.icon,
    this.hideTextOnMobile = true,
  });

  @override
  Widget build(BuildContext context) {
    bool shouldHide = hideTextOnMobile &&
        MediaQuery.of(context).size.width < AppGlobalTheme.breakPoint;
    return AppTextButton(
      onPressed: onPressed,
      child: SizedBox(
        height: 18,
        child: shouldHide
            ? icon
            : Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(title),
                  const SizedBox(width: 8),
                  icon,
                ],
              ),
      ),
    );
  }
}

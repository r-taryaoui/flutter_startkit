import 'package:flutter/material.dart';
import 'package:ma_friperie/app/libraries/theme.dart';

class AppInput extends StatelessWidget {
  final String placeholder;
  final ValueSetter<String> onChangeFunc;
  final ValueSetter<String>? onSubmittedFunc;
  final IconData? icon;
  final bool isPassword;
  final bool autofocus;
  final FocusNode? focusNode;
  final TextInputType keyboardType;

  const AppInput({
    super.key,
    required this.placeholder,
    required this.onChangeFunc,
    this.onSubmittedFunc,
    this.icon,
    this.isPassword = false,
    this.autofocus = false,
    this.keyboardType = TextInputType.text,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: TextField(
        focusNode: focusNode,
        autofocus: autofocus,
        obscureText: isPassword,
        onChanged: onChangeFunc,
        onSubmitted: onSubmittedFunc,
        keyboardType: keyboardType,
        minLines: keyboardType == TextInputType.multiline ? 2 : 1,
        maxLines: keyboardType == TextInputType.multiline ? 4 : 1,
        decoration: InputDecoration(
          hintText: placeholder,
          hintStyle: const TextStyle(
            //  color: Colors.black54,
            fontSize: 18,
          ),
          prefixIcon: icon != null ? Icon(icon) : null,
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: AppGlobalTheme.primaryColor)),
        ),
      ),
    );
  }

  Widget oldBbuild(BuildContext context) {
    return Flexible(
      child: Container(
        decoration: BoxDecoration(
          // color: Colors.grey[100],
          border: Border.all(color: AppGlobalTheme.primaryColor),
          borderRadius: const BorderRadius.all(Radius.circular(4.0)),
        ),
        child: TextField(
          focusNode: focusNode,
          autofocus: autofocus,
          obscureText: isPassword,
          onChanged: onChangeFunc,
          onSubmitted: onSubmittedFunc,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: placeholder,
            hintStyle: const TextStyle(
              fontSize: 18,
            ),
            prefixIcon: Icon(icon),
          ),
          style: const TextStyle(),
        ),
      ),
    );
  }
}

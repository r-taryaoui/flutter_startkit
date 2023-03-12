import 'dart:developer';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:ma_friperie/app/libraries/constants.dart';
import 'package:ma_friperie/app/libraries/theme.dart';
import 'package:ma_friperie/pages/app/app.holder.dart';

class AppSplash extends StatefulWidget {
  static const routeName = '/';
  const AppSplash({super.key});
  @override
  State<AppSplash> createState() => _AppSplashState();
}

class _AppSplashState extends State<AppSplash> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void goToValidePage() {
    Get.offAllNamed(AppHolder.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            color: AppGlobalTheme.primaryColor,
            child: Column(
              children: [
                Lottie.asset(
                  AppConstants.splashAnimatedLottie,
                  controller: _controller,
                  height: MediaQuery.of(context).size.height - 200,
                  animate: true,
                  onLoaded: (composition) {
                    _controller
                      ..duration = composition.duration
                      ..forward().whenComplete(() {
                        _controller.repeat();
                        goToValidePage();
                      });
                  },
                ),
                SvgPicture.asset(
                  AppConstants.logoSvgWhite,
                  height: 40,
                ),
                const SizedBox(height: 22),
              ],
            ),
          ),
          const Spacer(),
          buildText(context),
          const Spacer(),
        ],
      ),
    );
  }

  Widget buildText(BuildContext context) {
    const colorizeColors = [
      AppGlobalTheme.primaryColor,
      AppGlobalTheme.secondaryColor,
      AppGlobalTheme.primaryColor,
    ];

    List<String> texts = [
      "Chargement des données",
      "Préparation des données",
      "Chargement d'application"
    ];

    List<String> titles = [
      "Chargement en cours",
      "Présque términé",
      "À vos marques, Prés !"
    ];

    List<AnimatedText> textList = [];
    List<AnimatedText> titlesList = [];

    for (String text in texts) {
      textList.add(
        ColorizeAnimatedText(
          text,
          textStyle: const TextStyle(
            fontSize: 18,
          ),
          colors: colorizeColors,
        ),
      );
    }

    for (String title in titles) {
      titlesList.add(
        TypewriterAnimatedText(
          title,
          textStyle: const TextStyle(
            fontSize: 12,
          ),
        ),
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          child: AnimatedTextKit(
            animatedTexts: textList,
            isRepeatingAnimation: true,
            onTap: () {
              log("Tap Event");
            },
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          child: AnimatedTextKit(
            animatedTexts: titlesList,
            isRepeatingAnimation: true,
            onTap: () {
              log("Tap Event");
            },
          ),
        ),
      ],
    );
  }
}

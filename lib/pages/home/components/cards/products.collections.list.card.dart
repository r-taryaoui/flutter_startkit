import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ma_friperie/app/entities/product.collection.dart';
import 'package:ma_friperie/components/buttons/text.icon.button.dart';
import 'package:ma_friperie/components/cards/title.card.dart';
import 'package:ma_friperie/pages/home/components/cards/product.collection.view.card.dart';
import 'package:ma_friperie/pages/home/controllers/home.controller.dart';

class AppProductsCollectionsCard extends StatelessWidget {
  const AppProductsCollectionsCard({super.key});

  @override
  Widget build(BuildContext context) {
    AppHomeController homeController = Get.find();
    return Obx(
      () => AppTitledCard(
        title: "Dernieres collections ",
        action: Row(
          children: [
            AppTextIconButton(
              onPressed: homeController.getProductsCollections,
              title: "Actualiser",
              icon: (homeController.isLoadingCollections.value)
                  ? const SizedBox(
                      height: 18,
                      width: 18,
                      child: CircularProgressIndicator.adaptive(),
                    )
                  : const Icon(Icons.refresh),
            ),
            AppTextIconButton(
              onPressed: homeController.mockLoading,
              title: "Voir tout",
              icon: Icon(Icons.adaptive.arrow_forward),
            )
          ],
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: (homeController.isLoadingCollections.value)
              ? Row(
                  children:
                      AppProductCollectionViewCard.buildLoadingList(context),
                )
              : Row(
                  children: AppProductCollectionViewCard.buildList(
                      context,
                      homeController.listCollections.value
                          as List<AppProductCollection>),
                ),
        ),
      ),
    );
  }
}

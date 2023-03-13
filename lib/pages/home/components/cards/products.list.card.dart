import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ma_friperie/components/buttons/text.icon.button.dart';
import 'package:ma_friperie/components/cards/title.card.dart';
import 'package:ma_friperie/pages/home/components/cards/product.view.card.dart';
import 'package:ma_friperie/pages/home/controllers/home.controller.dart';

class AppProductsListCard extends StatelessWidget {
  const AppProductsListCard({super.key});

  @override
  Widget build(BuildContext context) {
    AppHomeController homeController = Get.find();
    return Obx(
      () => AppTitledCard(
        title: "Dernieres Produits",
        action: Row(
          children: [
            AppTextIconButton(
              onPressed: homeController.getProducts,
              title: "Actualiser",
              icon: (homeController.isLoadingCards.value)
                  ? const SizedBox(
                      height: 18,
                      width: 18,
                      child: CircularProgressIndicator.adaptive())
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
          child: (homeController.isLoadingCards.value)
              ? Row(
                  children: AppProductViewCard.buildLoadingList(context),
                )
              : Row(
                  children: AppProductViewCard.buildList(
                      context, homeController.listProducts.value ?? []),
                ),
        ),
      ),
    );
  }
}

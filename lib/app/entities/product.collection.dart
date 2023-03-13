import 'dart:developer';

import 'package:ma_friperie/api/base/routes/api.routes.dart';

class AppProductCollection {
  String id = "";
  String slug = "";
  String title = "";
  String description = "";
  String safeDescription = "";
  String? background;

  bool isReal = false;

  bool containsText(String text) {
    if (slug.toString().toLowerCase().contains(text.toLowerCase())) {
      return true;
    }
    if (title.toString().toLowerCase().contains(text.toLowerCase())) {
      return true;
    }
    if (description.toString().toLowerCase().contains(text.toLowerCase())) {
      return true;
    }
    return false;
  }

  AppProductCollection({
    this.slug = "test",
    this.title = "test",
    this.description = "",
    this.safeDescription = "",
    this.background,
  });

  @override
  bool operator ==(Object other) {
    return (other is AppProductCollection && id == other.id);
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => title;

  String? get backgroundURL =>
      background != null ? "${MainApiRoutes.currentDomain}$background" : null;

  AppProductCollection.createFromApiResponse(Map<String, dynamic> userData) {
    if (userData.containsKey("slug")) {
      slug = userData['slug'];
    }
    if (userData.containsKey("title")) {
      title = userData['title'];
    }
    if (userData.containsKey("description")) {
      description = userData['description'];
    }

    if (userData.containsKey("safeDescription")) {
      safeDescription = userData['safeDescription'];
    }

    if (userData.containsKey("background")) {
      background = userData['background'];
    }

    isReal = true;
  }

  Map<String, String> toMap() {
    return {
      'id': id,
      'slug': slug,
      'title': title,
      'description': description,
    };
  }

  static List<AppProductCollection> createListFromApiResponse(
      List<dynamic> list) {
    List<AppProductCollection> products = [];
    for (dynamic element in list) {
      try {
        AppProductCollection product =
            AppProductCollection.createFromApiResponse(element);
        products.add(product);
      } catch (e) {
        log("products $e");
      }
    }
    return products;
  }
}

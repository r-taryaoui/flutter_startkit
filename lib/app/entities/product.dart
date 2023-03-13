import 'dart:developer';

import 'package:ma_friperie/api/base/routes/api.routes.dart';

class AppProduct {
  String id = "";
  String slug = "";
  String title = "";
  String description = "";
  String safeDescription = "";

  double price = 0;
  double oldPrice = 0;

  AppProductPicture? picture;

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

  AppProduct({
    this.slug = "test",
    this.title = "test",
    this.description = "",
    this.price = 0,
    this.oldPrice = 0,
    this.picture,
  });

  @override
  bool operator ==(Object other) {
    return (other is AppProduct && id == other.id);
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => title;

  AppProduct.createFromApiResponse(Map<String, dynamic> userData) {
    if (userData.containsKey("slug")) {
      slug = userData['slug'].toString();
    }
    if (userData.containsKey("title")) {
      title = userData['title'].toString();
    }
    if (userData.containsKey("description")) {
      description = userData['description'].toString();
    }
    if (userData.containsKey("safeDescription")) {
      safeDescription = userData['safeDescription'].toString();
    }
    if (userData.containsKey("price")) {
      price = double.tryParse(userData['price'].toString()) ?? 0;
    }

    if (userData.containsKey("oldPrice")) {
      oldPrice = double.tryParse(userData['oldPrice'].toString()) ?? 0;
    }

    if (userData.containsKey("picture") && userData['picture'] != null) {
      picture = AppProductPicture.createFromApiResponse(userData['picture']);
    }

    isReal = true;
  }

  Map<String, String> toMap() {
    return {
      'id': id,
      'slug': slug,
      'title': title,
      'description': description,
      'price': price.toStringAsFixed(2),
      'oldPrice': oldPrice.toStringAsFixed(2),
    };
  }

  static List<AppProduct> createListFromApiResponse(List<dynamic> list) {
    List<AppProduct> products = [];
    for (dynamic element in list) {
      try {
        AppProduct product = AppProduct.createFromApiResponse(element);
        products.add(product);
      } catch (e) {
        log("e : $e");
      }
    }
    return products;
  }
}

class AppProductPicture {
  String id = "";
  String origin = "/uploads/images/products";
  String thumbnail = "640db06b0cb47371092348.jpg";

  bool isReal = false;
  String get fullPath => "${MainApiRoutes.currentDomain}$origin/$thumbnail";
  AppProductPicture({
    this.id = "",
    this.origin = "/uploads/images/products",
    this.thumbnail = "640db06b0cb47371092348.jpg",
  });

  @override
  bool operator ==(Object other) {
    return (other is AppProductPicture && id == other.id);
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => thumbnail;

  AppProductPicture.createFromApiResponse(Map<String, dynamic> userData) {
    if (userData.containsKey("id")) {
      id = userData['id'].toString();
    }
    if (userData.containsKey("originPath")) {
      origin = userData['originPath'].toString();
    }
    if (userData.containsKey("thumbnail")) {
      thumbnail = userData['thumbnail'].toString();
    }
    isReal = true;
  }

  Map<String, String> toMap() {
    return {
      'id': id,
      'origin': origin,
      'thumbnail': thumbnail,
    };
  }

  static List<AppProductPicture> createListFromApiResponse(List<dynamic> list) {
    List<AppProductPicture> products = [];
    for (dynamic element in list) {
      try {
        AppProductPicture product =
            AppProductPicture.createFromApiResponse(element);
        products.add(product);
      } catch (e) {
        log("e : $e");
      }
    }
    return products;
  }
}

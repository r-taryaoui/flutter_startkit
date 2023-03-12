import 'package:ma_friperie/api/base/api.connect.dart';
import 'package:ma_friperie/app/entities/session.dart';

enum AppUserType {
  admin,
  seller,
  buyer,
  expert,
  manager,
}

class AppUser {
  AppUserType userType = AppUserType.buyer;
  String encoded = "";
  String username = "taryaoui";
  String title = "M.";
  String lastName = "xx";
  String firstName = "xx";
  String email = "taryaoui@gmail.com";
  String phone = "06 00 00 00";
  String picture =
      "${MainApiConnect.currentDomain}/images/uploads/users/male.png";

  String get fullName => "$title $lastName $firstName";
  int vouchers = 0;
  bool isReal = false;

  bool containsText(String text) {
    if (fullName.toString().toLowerCase().contains(text.toLowerCase())) {
      return true;
    }
    if (email.toString().toLowerCase().contains(text.toLowerCase())) {
      return true;
    }
    if (phone.toString().toLowerCase().contains(text.toLowerCase())) {
      return true;
    }
    return false;
  }

  AppUser({
    this.username = "taryaoui",
    this.title = "M.",
    this.lastName = "xx",
    this.firstName = "xx",
    this.email = "taryaoui@gmail.com",
    this.phone = "06 00 00 00",
  });

  @override
  bool operator ==(Object other) {
    return (other is AppUser && encoded == other.encoded) ||
        (other is AppSession && encoded == other.user?.encoded);
  }

  @override
  int get hashCode => encoded.hashCode;

  @override
  String toString() => fullName;

  AppUserType getUserType(String? text) {
    switch (text.toString().toUpperCase()) {
      case "ADMIN":
        return AppUserType.admin;
      case "SELLER":
        return AppUserType.seller;
      default:
        return AppUserType.buyer;
    }
  }

  AppUser.createFromApiResponse(Map<String, dynamic> userData) {
    if (userData.containsKey("username") &&
        userData.containsKey("lastName") &&
        userData.containsKey("firstName") &&
        userData.containsKey("email") &&
        userData.containsKey("phone")) {
      encoded = userData['id'];
      username = userData['username'];
      lastName = userData['lastName'];
      firstName = userData['firstName'];
      email = userData['email'];
      phone = userData['phone'];

      if (userData.containsKey("picture")) {
        picture = "${MainApiConnect.currentDomain}/${userData['picture']}";
      }

      if (userData.containsKey("vouchers")) {
        vouchers = int.tryParse(userData['vouchers'].toString()) ?? 0;
      }

      if (userData.containsKey("typeCode")) {
        switch (userData['typeCode'].toString().toUpperCase()) {
          case "ADMIN":
            userType = AppUserType.admin;
            break;
          case "EXPERT":
            userType = AppUserType.expert;
            break;
          case "SELLER":
            userType = AppUserType.seller;
            break;
          default:
            userType = AppUserType.buyer;
        }
      }
    }
    isReal = true;
  }

  Map<String, String> toMap() {
    return {
      'userType': userType.toString(),
      'encoded': encoded,
      'username': username,
    };
  }

  String get type {
    switch (userType) {
      case AppUserType.admin:
        return "Adminstrateur";
      case AppUserType.seller:
        return "Vendeur";
      case AppUserType.buyer:
        return "Ferrailleur";
      case AppUserType.expert:
        return "Expert compagnie";
      default:
        return "Utilisateur";
    }
  }

  bool get isAdmin {
    return userType == AppUserType.admin;
  }

  bool get isExpert {
    return userType == AppUserType.expert;
  }

  bool get isBuyer {
    return userType == AppUserType.buyer;
  }

  bool get isSeller {
    return userType == AppUserType.seller;
  }

  bool get isUser {
    return !isAdmin && !isBuyer && !isSeller;
  }

  bool get canValidateCars {
    return isExpert || isAdmin;
  }
}

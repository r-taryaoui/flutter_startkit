import 'package:get/get.dart';

class MainApiConnect extends GetConnect {
  static bool isProd = true;
  static String localDomain = "https://127.0.0.1:8000";
  static String domain = "https://digexpertise.com";

  final String sessionId;
  final String sessionToken;

  MainApiConnect({this.sessionId = "", this.sessionToken = ""});

  static String get currentDomain => isProd ? domain : localDomain;
}

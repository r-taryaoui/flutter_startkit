class MainApiRoutes {
  // ENDPOINT
  static bool isProd = false;
  static String localDomain =
      "https://2638-105-191-48-83.ngrok.io"; //   "https://127.0.0.1:8000"; //
  static String domain = "https://mafriperie.ma";
  static String get currentDomain => isProd ? domain : localDomain;

  // SECURITY
  static String login = "apis/login_check";
  static String validate = "apis/token_check";
}

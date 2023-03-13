import 'dart:developer';

import 'package:ma_friperie/app/entities/user.dart';

class AppSession {
  String sessionId = "x";
  String sessionToken = "x";
  AppUser? user;

  AppSession();

  @override
  bool operator ==(Object other) {
    return (other is AppUser && user == other) ||
        (other is AppSession &&
            sessionId == other.sessionId &&
            sessionToken == other.sessionToken);
  }

  @override
  int get hashCode => sessionToken.hashCode;

  @override
  String toString() => headerToken;

  String get headerToken => "$sessionId;$sessionToken";

  AppSession.createFromResponse(Map<String, dynamic> session) {
    try {
      log("AppSession.createFromResponse");
      log(session.toString());
      if (session.containsKey("id")) {
        sessionId = session['id'].toString();
      }
      if (session.containsKey("token")) {
        sessionToken = session['token'];
      }
      if (session.containsKey("user")) {
        try {
          user = AppUser.createFromApiResponse(session['user']);
        } catch (e) {
          log("exception while making AppSession.user from response");
          log(e.toString());
        }
      }
    } catch (e) {
      log("exception while making AppSession from response");
      log(e.toString());
    }
  }
}

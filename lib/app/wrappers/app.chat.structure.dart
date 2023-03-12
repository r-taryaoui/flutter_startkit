import 'package:ma_friperie/app/entities/user.dart';

class AppChatStructure {
  AppUser? user;
  String? lastMessage;
  List<AppChatMessageStructure> messages = [];

  bool containsText(String text) {
    if (lastMessage.toString().toLowerCase().contains(text.toLowerCase())) {
      return true;
    }
    if (user?.containsText(text) ?? false) {
      return true;
    }
    return false;
  }

  AppChatStructure({
    this.user,
    this.lastMessage,
    this.messages = const [],
  });

  AppChatStructure.createSample({message = "this is a test"}) {
    user = AppUser();
    lastMessage = message;
  }

  static List<AppChatStructure> getSamples() {
    List<AppChatStructure> samples = [];
    for (int i = 0; i < 100; i++) {
      samples.add(
        AppChatStructure(
          user: AppUser(
            lastName: "Test",
            firstName: "Prénom-$i",
          ),
          lastMessage: "this is a test $i",
          messages: AppChatMessageStructure.getSamples(),
        ),
      );
    }
    return samples;
  }
}

class AppChatMessageStructure {
  DateTime sent = DateTime.now();
  String message = "";
  bool isReceived = true;
  AppChatMessageStructure();

  AppChatMessageStructure.createSample(
      {String msg = "this is a test", bool received = true}) {
    sent = DateTime.now();
    message = msg;
    isReceived = received;
  }

  static List<AppChatMessageStructure> getSamples() {
    return [
      AppChatMessageStructure.createSample(
        msg: "this is a test 1",
        received: true,
      ),
      AppChatMessageStructure.createSample(
        msg: "this is a test 2",
        received: false,
      ),
      AppChatMessageStructure.createSample(
        msg: "this is a test 3",
        received: true,
      ),
    ];
  }
}

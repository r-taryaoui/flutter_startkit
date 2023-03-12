import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ma_friperie/app/libraries/theme.dart';
import 'package:ma_friperie/app/wrappers/app.chat.structure.dart';
import 'package:ma_friperie/components/general/drawer.home.dart';
import 'package:ma_friperie/pages/chat/components/chat.search.input.dart';
import 'package:ma_friperie/pages/chat/controllers/app.chat.controller.dart';

class AppChatPage extends StatefulWidget {
  static const routeName = '/messages';
  const AppChatPage({super.key});

  @override
  State<AppChatPage> createState() => _AppChatPageState();
}

class _AppChatPageState extends State<AppChatPage> {
  late AppChatController appChatController;

  @override
  void initState() {
    appChatController = AppChatController();
    Get.put(appChatController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle:
            MediaQuery.of(context).size.width <= AppGlobalTheme.breakPoint,
        title: const Text('Messagerie'),
      ),
      drawer: buildDrawer(context),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(8),
            child: const ChatSearchInputWidget(),
          ),
          Expanded(
            child: Obx(() => ListView.builder(
                  itemCount: appChatController.filteredChatList.length,
                  itemBuilder: (context, index) {
                    return buildTile(
                      context,
                      appChatController.filteredChatList.elementAt(index),
                    );
                  },
                )),
          ),
        ],
      ),
    );
  }

  Widget buildTile(
    BuildContext context,
    AppChatStructure chat,
  ) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundColor: AppGlobalTheme.primaryColor,
        child: Icon(Icons.account_circle,
            size: 38, color: AppGlobalTheme.primaryColorContrast),
      ),
      title: Text(chat.user?.fullName ?? "This is a test"),
      subtitle: Text(chat.lastMessage ?? "No messages"),
      trailing: const Icon(Icons.more_vert),
    );
  }

  Widget? buildDrawer(BuildContext context) {
    return (MediaQuery.of(context).size.width <= AppGlobalTheme.breakPoint)
        ? const AppHomeDrawer()
        : null;
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ma_friperie/pages/chat/controllers/app.chat.controller.dart';

class ChatSearchInputWidget extends StatefulWidget {
  const ChatSearchInputWidget({super.key});

  @override
  State<ChatSearchInputWidget> createState() => _SearchInputWidgetState();
}

class _SearchInputWidgetState extends State<ChatSearchInputWidget> {
  TextEditingController textController = TextEditingController();
  AppChatController appChatController = Get.find();

  bool hasText = false;

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  void clearSearch() {
    textController.clear();
    appChatController.setSearchQuery("");
    setState(() {
      hasText = false;
    });
  }

  void executeSearch(String text) {
    appChatController.setSearchQuery(text);
    setState(() {
      hasText = text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: textController,
              keyboardType: TextInputType.name,
              onChanged: executeSearch,
              onSubmitted: executeSearch,
              decoration: const InputDecoration(
                  hintText: 'Rechercher',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(10),
                  suffixIcon: Icon(Icons.search)),
            ),
          ),
          if (hasText)
            IconButton(
              onPressed: clearSearch,
              icon: const Icon(Icons.close),
              color: Colors.grey,
            ),
        ],
      ),
    );
  }
}

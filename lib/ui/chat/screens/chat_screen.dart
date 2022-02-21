import 'package:appgangapp/services/firestore/firestore_service.dart';
import 'package:appgangapp/services/firestore/firestore_service_messages.dart';
import 'package:appgangapp/ui/chat/controllers/message_controller.dart';
import 'package:appgangapp/ui/chat/widgets/list_messages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MessageController messageController = Get.find();
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 10.0, bottom: 50.0),
            child: ListMessagesChat(),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              width: double.infinity,
              color: Colors.grey[300],
              child: Row(
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: TextField(
                      controller: messageController.msgController,
                      minLines: 1,
                      maxLines: 10,
                      onChanged: messageController.getMessages,
                      style: const TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 5),
                        hintText: "Escribe tu mensaje",
                        hintStyle: TextStyle(color: Colors.black38),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  FloatingActionButton(
                    mini: true,
                    onPressed: () {
                      String _messageId =
                          FirestoreService("chat_messages").generateId();
                      DatabaseMessages.addMessage(
                          _messageId,
                          messageController.message.value,
                          Get.parameters['roomId']!);
                      messageController.msgController.clear();
                    },
                    child: const Icon(
                      Icons.send,
                      size: 20,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

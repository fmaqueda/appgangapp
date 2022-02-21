import 'package:appgangapp/models/messages/message_model.dart';
import 'package:appgangapp/services/firestore/firestore_service_messages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

List<String> roomsChats = [
  "General",
  "Sports",
  "Cinema",
  "Music",
];

class MessageController extends GetxController {
  TextEditingController msgController = TextEditingController();
  Rx<String> message = "".obs;
  Rx<int> chargeM = 5.obs;
  Rx<List<MessageModel>> messagesList = Rx<List<MessageModel>>([]);
  List<MessageModel> get messages => messagesList.value.obs;

  getMessages(String value) => message.value = value;

  @override
  void onReady() async {
    messagesList.bindStream(
      DatabaseMessages()
          .chatMessageStrem(Get.parameters['roomId']!, chargeM.value),
    );
    //print(messagesList.value);

    super.onReady();
  }

  @override
  void onClose() {
    msgController.dispose();
    super.onClose();
  }

  void updateStream() async {
    messagesList.bindStream(
      DatabaseMessages()
          .chatMessageStrem(Get.parameters['roomId']!, chargeM.value),
    );
  }
}

import 'package:appgangapp/ui/chat/controllers/message_controller.dart';
import 'package:appgangapp/ui/chat/widgets/row_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListMessagesChat extends StatelessWidget {
  const ListMessagesChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MessageController messageController = Get.find();
    return Obx(
      () => NotificationListener<ScrollEndNotification>(
        onNotification: (notification) {
          messageController.chargeM.value =
              (messageController.chargeM.value + 5);
          messageController.updateStream();
          print(notification);
          return true;
        },
        child: ListView.builder(
          reverse: false,
          itemCount: messageController.messagesList.value.length,
          itemBuilder: (BuildContext ctx, index) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: RowMessage(
                  message: messageController.messagesList.value[
                      messageController.messagesList.value.length - index - 1]),
              //Text(messageController.messagesList.value[index].text!),
            );
          },
        ),
      ),
    );
  }
}

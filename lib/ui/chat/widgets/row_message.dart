import 'package:appgangapp/models/messages/message_model.dart';
import 'package:appgangapp/ui/auth/controllers/auth_controller.dart';
import 'package:appgangapp/ui/theme/color_theme.dart';
import 'package:appgangapp/ui/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RowMessage extends StatelessWidget {
  final MessageModel message;
  const RowMessage({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.find();
    return Container(
      width: double.infinity,
      child: (authController.firestoreUser!.value != null &&
              authController.firestoreUser!.value!.name != null)
          ? _columnText(message,
              (message.content == authController.firestoreUser!.value!.name))
          : _columnText(message, false),
    );
  }

  Widget _columnText(MessageModel message, bool position) {
    return Row(
        mainAxisAlignment:
            (position) ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Container(
            margin: (position)
                ? const EdgeInsets.only(left: 50.0)
                : const EdgeInsets.only(right: 50.0),
            child: Card(
              color: (position)
                  ? AppColors.backgroudColorOne
                  : AppColors.colorObscure,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      child: Text(
                        message.content! + " escribió: ",
                        style: (position)
                            ? textThemePropio.bodyText1!.copyWith(
                                color: AppColors.colorObscure,
                                fontWeight: FontWeight.bold,
                              )
                            : textThemePropio.bodyText1!.copyWith(
                                color: AppColors.white,
                                fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      child: Text(
                        message.text!,
                        style: (position)
                            ? textThemePropio.bodyText2!.copyWith(
                                color: AppColors.colorObscure,
                              )
                            : textThemePropio.bodyText2!.copyWith(
                                color: AppColors.white,
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]);
  }
}

import 'package:appgangapp/theme/color_theme.dart';
import 'package:flutter/material.dart';

void showAlertDialog(BuildContext context,
    {required String? message,
    required String? heading,
    required String? buttonAcceptTitle}) {
  // set up the buttons

  Widget continueButton = TextButton(
    style: TextButton.styleFrom(backgroundColor: AppColors.orangeButton),
    onPressed: () => Navigator.pop(context, 'OK'),
    child: const Text('OK'),
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    backgroundColor: Colors.black.withOpacity(0.5),
    title: Text(heading!),
    content: Text(message!),
    actions: [
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

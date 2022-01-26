import 'package:flutter/material.dart';

/// This is the stateless widget that the main application instantiates.
class MyAlertDialogWidget extends StatelessWidget {
  const MyAlertDialogWidget({
    Key? key,
    required this.titulo,
    required this.descripcion,
  }) : super(key: key);

  final String? titulo;
  final String? descripcion;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('$titulo!'),
      content: Text('$descripcion!'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'OK'),
          child: const Text('OK'),
        ),
      ],
    );
  }
}

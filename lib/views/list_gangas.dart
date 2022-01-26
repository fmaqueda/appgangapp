import 'package:flutter/material.dart';

class ListGangas extends StatelessWidget {
  const ListGangas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text("Listado de Gangas"),
          titleTextStyle: TextStyle(color: Colors.black),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: Center(
          child: Text("Aqui La Lista de Productos"),
        ));
  }
}

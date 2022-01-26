import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*
    bool lightMode =
        MediaQuery.of(context).platformBrightness == Brightness.light;
    */
    return Scaffold(
      /*
      backgroundColor:
          lightMode ? const Color(0xffe1f5fe) : const Color(0xff042a49),
      */
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background-splash.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Image.asset('assets/images/logogangapp.png'),
          /*
            child: lightMode
                ? Image.asset('assets/images/logogangapp.png')
                : Image.asset('assets/images/background-splash.png')),
          */
        ),
      ),
    );
  }
}

import 'package:appgangapp/ui/auth/screens/signin_page.dart';
import 'package:appgangapp/ui/auth/screens/signup_page.dart';
import 'package:appgangapp/ui/theme/color_theme.dart';
import 'package:appgangapp/ui/theme/text_theme.dart';

import 'package:flutter/material.dart';

class HomePageTab extends StatelessWidget {
  const HomePageTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leadingWidth: 5,
          title: TabBar(
            indicatorColor: AppColors.backgroudColorFour,
            tabs: [
              Tab(
                icon: Text(
                  "Log In",
                  style: textThemePropio.headline6!
                      .copyWith(fontWeight: FontWeight.w600, fontSize: 20),
                ),
              ),
              Tab(
                icon: Text(
                  "Registrarse",
                  style: textThemePropio.headline6!
                      .copyWith(fontWeight: FontWeight.w600, fontSize: 20),
                ),
              )
            ],
          ),
        ),
        body: TabBarView(children: [SigInPage(), SigUpPage()]),
      ),
    );
  }
}

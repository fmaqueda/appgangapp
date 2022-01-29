import 'package:appgangapp/auth/controllers/auth_controller.dart';
import 'package:appgangapp/global_widgets/form_input_field.dart';
import 'package:appgangapp/global_widgets/show_get_dialog.dart';
import 'package:appgangapp/theme/color_theme.dart';
import 'package:appgangapp/utils/form_validators.dart';
import 'package:appgangapp/products/screens/list_gangas.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

bool obscureText = true;

class SigInPage extends StatelessWidget {
  SigInPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

/*
  @override
  Widget build(BuildContext context) {
    //AuthController authController = AuthController();
    //final AuthController authController = Get.find();
    return const Scaffold(
      body: Center(
        child: Text("Sign IN"),
      ),
    );
  }
*/

  @override
  Widget build(BuildContext context) {
    //AuthController authController = AuthController();
    final AuthController authController = Get.find();
    return Scaffold(
      /*
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(const ProfilePage());
        },
      ),
      */
      body: Center(
        child: ListView(
          children: [
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    /*
                    Container(
                      child: Text(
                        "Log In",
                        style: appTheme.textTheme.headline6!.copyWith(
                            fontWeight: FontWeight.w600, fontSize: 20),
                      ),
                    ),
                    */

                    const SizedBox(
                      height: 30,
                    ),
                    FormInputField(
                      validator: FormValidator().isValidEmail,
                      labelText: "Email",
                      hintText: "introduce tu Email",
                      obscureText: false,
                      controller: authController.emailController,
                      keyboardType: TextInputType.emailAddress,
                      maxLines: 1,
                      minLines: 1,
                      onChanged: (value) => null,
                      onSaved: (value) =>
                          authController.emailController.text = value!,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Obx(
                      () => FormInputField(
                        validator: FormValidator().isValidPassword,
                        labelText: "Password",
                        hintText: "Introduce tu contraseña",
                        obscureText: authController.obscureTextPassword.value,
                        controller: authController.passwordController,
                        keyboardType: TextInputType.name,
                        minLines: 1,
                        maxLines: 1,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            authController.obscureTextPassword.value =
                                !authController.obscureTextPassword.value;
                          },
                          child: const Icon(
                            Icons.remove_red_eye_rounded,
                            color: Colors.grey,
                          ),
                        ),
                        onChanged: (value) => null,
                        onSaved: (value) =>
                            authController.passwordController.text = value!,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: SignInButton(
                          Buttons.Google,
                          text: "Sign up with Google",
                          onPressed: () async {
                            authController.addToken();
                            User? _okGSignIn =
                                await authController.signInGoogle();
                            if (_okGSignIn != null) {
                              Get.to(ListGangas());
                            } else {
                              showGetDialog(
                                context,
                                "Error usuario",
                                "No te has logueado con tu cuenta de Google",
                              );
                            }
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50.0),
                      child: SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                AppColors.colorButton),
                          ),
                          onPressed: () async {
                            authController.addToken();
                            await authController.signInAnonymous();
                            Get.to(ListGangas());
                          },
                          child: const Text("Entrar Anonimamente"),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                AppColors.colorButton),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              if (authController.passwordController.text ==
                                  "") {
                                showGetDialog(
                                  context,
                                  "Alert Password Vacia",
                                  "No has introducido un Password!!",
                                );
                              } else {
                                bool _itsOK = await authController
                                    .signInWithEmailAndPassword(context);

                                if (_itsOK == true) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Tus datos son correctos"),
                                    ),
                                  );
                                  Get.to(ListGangas());
                                }
                              }
                            }
                          },
                          child: const Text("Login"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

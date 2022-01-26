import 'package:appgangapp/controllers/modules/auth/auth_controllers/auth_controller.dart';
import 'package:appgangapp/global_widgets/form_input_field.dart';
import 'package:appgangapp/global_widgets/show_get_dialog.dart';
import 'package:appgangapp/theme/color_theme.dart';
import 'package:appgangapp/utils/form_validators.dart';
import 'package:appgangapp/views/list_gangas.dart';
import 'package:appgangapp/views/terms_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

bool obscureText = true;

class SigUpPage extends StatelessWidget {
  SigUpPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  final AuthController authController = Get.find();

/*
  @override
  Widget build(BuildContext context) {
    //AuthController authController = AuthController();
    //final AuthController authController = Get.find();
    return const Scaffold(
      body: Center(
        child: Text("Sign UP"),
      ),
    );
  }
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(authController.passwordController.text);
          print(authController.emailController.text);
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                    FormInputField(
                      validator: FormValidator().isValidName,
                      labelText: "Nombre",
                      hintText: "Introduce tu Nombre",
                      obscureText: false,
                      controller: authController.nameController,
                      keyboardType: TextInputType.name,
                      minLines: 1,
                      maxLines: 1,
                      onChanged: (value) => null,
                      onSaved: (value) =>
                          authController.nameController.text = value!,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Obx(
                      () => FormInputField(
                        validator: FormValidator().isValidPassword,
                        labelText: "Password",
                        hintText: "Introduce una Contraseña válida",
                        obscureText: authController.obscureTextPassword.value,
                        controller: authController.passwordController,
                        keyboardType: TextInputType.visiblePassword,
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
                    const SizedBox(
                      height: 20,
                    ),
                    Obx(
                      () => FormInputField(
                        validator: FormValidator().isValidPassword,
                        labelText: "Re-Password",
                        hintText: "Vuelve a introducir tu contraseña",
                        obscureText: authController.obscureTextRePassword.value,
                        controller: authController.repitePasswordController,
                        keyboardType: TextInputType.name,
                        minLines: 1,
                        maxLines: 1,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            authController.obscureTextRePassword.value =
                                !authController.obscureTextRePassword.value;
                          },
                          child: const Icon(
                            Icons.remove_red_eye_rounded,
                            color: Colors.grey,
                          ),
                        ),
                        onChanged: (value) => null,
                        onSaved: (value) => authController
                            .repitePasswordController.text = value!,
                      ),
                    ),
                    Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Checkbox(
                              value: authController.checkBoxValue.value,
                              activeColor: AppColors.backgroudColorTwo,
                              checkColor: AppColors.white,
                              onChanged: (newValue) {
                                authController.checkBoxValue.value = newValue!;
                              }),
                          InkWell(
                            onTap: () {
                              Get.to(const TermsPage());
                            },
                            child: const Text(
                              "Acepto terminos y condiciones",
                              /*
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(fontWeight: FontWeight.w700),
                                  */
                              style: TextStyle(
                                color: AppColors.colorObscure,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            focusColor: Colors.green,
                            splashColor: Colors.green,
                          ),
                        ],
                      ),
                    ),
/*
                    Obx(
                      () => GestureDetector(
                        onTap: () {
                          authController.checkedTerms.value =
                              !authController.checkedTerms.value;
                        },
                        child: Checkbox(
                          checkColor: Colors.blue,
                          activeColor: Colors.white,
                          value: authController.checkedTerms.value,
                          onChanged: (value) =>
                              authController.checkedTerms.value = value!,
                        ),
                      ),
                    ),
                    */
                    Padding(
                      padding: const EdgeInsets.only(top: 50.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: AppColors.colorButton,
                          minimumSize: const Size(double.infinity, 50),
                        ),
                        onPressed: () async {
                          if (authController.checkBoxValue.value == false) {
                            showGetDialog(
                              context,
                              "Terms & Conditions",
                              "Debes aceptar los términos y condiciones",
                            );
                          } else if (_formKey.currentState!.validate()) {
                            if (authController.passwordController.text !=
                                authController.repitePasswordController.text) {
                              //const MyAlertDialogWidget();
                              /*
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Tus passwords no coinciden"),
                                ),
                              );
                              */
                              /*
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) =>
                                    const MyAlertDialogWidget(
                                  titulo: "Alert Password",
                                  descripcion: "Las passwords no coinciden",
                                ),
                              );
                              */
                              /*
                              showAlertDialog(context,
                                  message:
                                      "Tus passwords no coinciden. Corrígelo!!",
                                  heading: "Alert Password",
                                  buttonAcceptTitle: "OK");
*/
                              showGetDialog(
                                context,
                                "Alert Password",
                                "Tus passwords no coinciden. Corrígelo!!",
                              );
                            } else {
                              bool _itsOK = await authController
                                  .registerWithEmailAndPassword(context);

                              if (_itsOK == true) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Tus datos son correctos"),
                                  ),
                                );
                                Get.to(const ListGangas());
                              }
                            }
                          }
                        },
                        child: const Text("Crear Cuenta"),
                      ),
                    ),
                  ],
                  /*
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          filled: false,
                          fillColor: Colors.amber,
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.pink, width: 2),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green, width: 2),
                          ),
                          labelText: "Nombre",
                          labelStyle: GoogleFonts.notoSans(
                              fontSize: 16, color: Colors.black),
                          hintText: "Ponga aqui su nombre",
                          hintStyle:
                              const TextStyle(fontSize: 18, color: Colors.blue),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Por favor escribe un texto";
                          }
                          return null;
                        },
                      ),
                    ),
                    TextFormField(
                      obscureText: obscureText,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Por favor escribe un texto 2";
                        }
                        return null;
                      },
                    ),
                    FormInputField(),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Tus datos son correctos"),
                            ),
                          );
                          Get.to(ListBeersPage());
                        }
                      },
                      child: const Text("Submit"),
                    ),
                  ], */
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

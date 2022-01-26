import 'package:appgangapp/theme/app_theme.dart';
import 'package:appgangapp/theme/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TermsPage extends StatelessWidget {
  const TermsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                Center(
                  child: Text(
                    "TERMINOS Y CONDICIONES",
                    style: appTheme.textTheme.headline6,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    terminosCondiciones,
                    style: appTheme.textTheme.caption,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: ElevatedButton(
              child: const Text("Regresar"),
              style: ElevatedButton.styleFrom(
                primary: AppColors.colorButton,
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: () {
                Get.back();
              },
            ),
          ),
        ],
      ),
    );
  }
}

String terminosCondiciones = """
    1. Estos Términos y Condiciones de Uso regulan las reglas a que se sujeta la utilización de la APP BEERNOTBEAR 
    (en adelante, la APP), que puede descargarse desde el dominio beernotbear.com La descarga o utilización de la APP atribuye 
    la condición de Usuario a quien lo haga e implica la aceptación de todas las condiciones incluidas en este documento y 
    en la Política de Privacidad y el Aviso Legal de dicha página Web. El Usuario debería leer estas condiciones cada 
    vez que utilice la APP, ya que podrían ser modificadas en lo sucesivo.
2. Únicamente los Usuarios expresamente autorizados por XXXEMPRESAXXX podrán acceder a la descarga y uso de la APP. 
Los Usuarios que no dispongan de autorización, no podrán acceder a dicho contenido.
3. Cargos: eres responsable del pago de todos los costes o gastos en los que incurrascomo resultado de descargar 
y usar la APP, incluido cualquier cargo de red de operador o itinerancia. Consulta con tu proveedor de servicios los detalles al respecto.

.......
  """;

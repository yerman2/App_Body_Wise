// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ETSPage extends StatelessWidget {
  const ETSPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 208, 138, 1),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      print('Clic en Regresar');
                      // Agrega aquí la lógica para regresar
                      Navigator.pushNamed(context, '/info_page');
                    },
                    child: Row(
                      children: [
                        Icon(Icons.arrow_back),
                        const SizedBox(width: 8.0),
                        Text(
                          'Regresar',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: Image.asset(
                      'assets/images/ETS.png',
                      fit: BoxFit.contain,
                      height: 100.0,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: Text(
                      'Enfermedades de transmisión sexual (ETS)',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/clamidia.png',
                          fit: BoxFit.cover,
                          height: 120.0,
                        ),
                        const SizedBox(height: 8.0),
                        Padding(
                          padding: const EdgeInsets.only(right: 38.0, top: 30.0),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Clamidia',
                              style: TextStyle(fontSize: 16, color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ETS común que puede afectar tanto a los hombres como a las mujeres. Pueden causar daño permanente en el aparato reproductor de la mujer.',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        const SizedBox(height: 18.0),
                        buildClickableText(
                          '¿Quiere Saber Más?. Clic aquí',
                          'https://drive.google.com/uc?export=view&id=1Yp6dkJEjqa5zUA7mRSZNxZA2pi1Wh4xv'
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/herpes.png',
                          fit: BoxFit.cover,
                          height: 120.0,
                        ),
                        const SizedBox(height: 8.0),
                        Padding(
                          padding: const EdgeInsets.only(right: 38.0),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Herpes \n genital',
                              style: TextStyle(fontSize: 16, color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'El herpes genital a menudo se propaga por contacto piel con piel durante las relaciones sexuales. Algunas personas infectadas con el virus pueden presentar síntomas muy leves o ningún síntoma.',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        const SizedBox(height: 18.0),
                        buildClickableText(
                          '¿Quiere Saber Más?. Clic aquí',
                          'https://drive.google.com/uc?export=view&id=1DDnvoU0CIlljef-XbcVCMxllZJe9U62m'
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40.0),
            // Nueva imagen centrada debajo de las dos primeras
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Image.asset(
                  'assets/images/etsx.png',
                  fit: BoxFit.contain,
                  height: 300.0,
                ),
              ),
            ),
            const SizedBox(height: 18.0),
            Center(
              child: buildClickableText(
                '¿Desea Saber Más Sobre las ETS? Click Aquí',
                 'https://drive.google.com/drive/folders/1bHrAGBpgaIlNO6HriXAFtUaSOXzbRXCD',
              ),
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }

  Widget buildClickableText(String text, String url) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: RichText(
        text: TextSpan(
          text: text,
          style: TextStyle(fontSize: 16, color: Colors.black),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              launch(url);
            },
        ),
      ),
    );
  }
}

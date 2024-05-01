// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types, avoid_print, deprecated_member_use

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PharmacyPage extends StatelessWidget {
  const PharmacyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color.fromRGBO(255, 208, 138, 1),
      body: SingleChildScrollView( // Agregado un SingleChildScrollView
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Flecha y texto en la esquina superior izquierda
            const SizedBox(height: 40.0),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      print('Clic en Regresar');
                      // Agrega aquí la lógica para regresar
                      Navigator.pushNamed(context, '/sesion_init');
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Imagen centrada en la parte superior
                  Image.asset(
                    'assets/images/farmacia.png',
                    fit: BoxFit.contain,
                    height: 70.0,
                  ),
                  const SizedBox(height: 16.0),
                  // Texto debajo de la imagen con GestureDetector
                  GestureDetector(
                    onTap: () {
                      // print('Clic en "Contenido de la pantalla"');
                      // Agrega aquí la lógica deseada al hacer clic en el texto
                    },
                    child: const Text(
                      'Farmacia',
                      style: TextStyle(fontSize: 24, color: Colors.black),
                    ),
                  ),
                  // Imágenes adicionales
                  const SizedBox(height: 16.0),
                  Image.asset(
                    'assets/images/f-centro.png',
                    fit: BoxFit.contain,
                    height: 210.0,
                  ),
                  const SizedBox(height: 16.0),
                  Image.asset(
                    'assets/images/f-norte.png',
                    fit: BoxFit.contain,
                    height: 210.0,
                  ),
                  const SizedBox(height: 16.0),
                  Image.asset(
                    'assets/images/f-sur.png',
                    fit: BoxFit.contain,
                    height: 210.0,
                  ),
                  const SizedBox(height: 16.0),
                  Image.asset(
                    'assets/images/f-afuera.png',
                    // fit: BoxFit.contain,
                    height: 210.0,
                  ),
                  const SizedBox(height: 16.0),
                  // Texto al final con enlace
                  buildClickableText(
                    '¿Buscas Farmacias Cercanas?. Clic Aquí',
                    'https://beacons.ai/alan24/farmacias', // Reemplaza con tu enlace real
                  ),
                  const SizedBox(height: 16.0),
                  // const Spacer(),
                  // Botón
                  // const ChatButton(),

                ],
              ),
            ),
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

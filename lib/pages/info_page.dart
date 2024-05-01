// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  const Info({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 208, 138, 1),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
          SizedBox(
              height:
                  10.0), // Ajusta el espacio entre la parte superior y la imagen
          Center(
            child: Column(
              children: [
                Image.asset(
                  'assets/images/informacion.png',
                  fit: BoxFit.contain,
                  height: 80.0,
                ),
                const SizedBox(
                    height: 8.0), // Ajusta el espacio entre las imágenes
                const Text(
                  'Informacion',
                  style: TextStyle(fontSize: 24, color: Colors.black),
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                      height:
                          8.0), // Ajusta el espacio entre el texto y la siguiente imagen
                  SizedBox(height: 16.0), // Agregado espacio entre las imágenes
                  GestureDetector(
                    onTap: () {
                      print('Clic en condon');
                      // Agrega aquí la lógica para regresar
                      Navigator.pushNamed(context, '/condon_page');
                    },
                    child: PostItem(
                      imagePath: 'assets/images/condon.png',
                      title: 'Métodos anticonceptivos',
                    ),
                  ),

                  const SizedBox(
                      height: 24.0), // Ajusta el espacio entre las imágenes
                  GestureDetector(
                    onTap: () {
                      print('Clic en ETS');
                      // Agrega aquí la lógica para regresar
                      Navigator.pushNamed(context, '/ets_page');
                    },
                    child: PostItem(
                      imagePath: 'assets/images/ETS.png',
                      title: 'Enfermedades de trasmisión sexual (ETS)',
                      addBottomMargin:
                          true, // Añade margen en la parte inferior
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PostItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final bool addBottomMargin;

  const PostItem({
    Key? key,
    required this.imagePath,
    required this.title,
    this.addBottomMargin = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.only(
          top: 8.0,
          bottom: addBottomMargin
              ? 16.0
              : 0.0), // Ajusta el espacio hacia arriba y abajo
      child: Column(
        children: [
          Image.asset(
            imagePath,
            fit: BoxFit.cover,
            height: 130.0,
          ),
          const SizedBox(height: 8.0),
          Text(
            title,
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
        ],
      ),
    );
  }
}

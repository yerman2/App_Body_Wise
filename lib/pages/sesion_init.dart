import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_circular_text/circular_text.dart';

// ignore: camel_case_types
class sesion_init extends StatefulWidget {
  const sesion_init({super.key});

  @override
  State<sesion_init> createState() => _sesion_init();
}

// ignore: camel_case_types
class _sesion_init extends State<sesion_init> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: AppBar(
      //   title: const Text('Título de la página'),
      //    automaticallyImplyLeading: false,
      // ),
      body: Center(
        child: SesionInitForm(),
      ),
    );
  }
}

class SesionInitForm extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const SesionInitForm({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(255, 208, 138, 1),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(height: 40.0),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/report_page');
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Image.asset(
                      'assets/images/reportar.png',
                      fit: BoxFit.contain,
                      height: 30.0,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/report_page');
                  },
                  child: const Text(
                    "Reportar",
                    style: TextStyle(fontSize: 22, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          CircularText(
            children: [
              TextItem(
                text: const Text(
                  '¿Qué quieres hacer?',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                space: 8,
                startAngle: -90,
                startAngleAlignment: StartAngleAlignment.center,
                direction: CircularTextDirection.clockwise,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/forum_page');
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Image.asset('assets/images/foro.png',
                              fit: BoxFit.contain, height: 90.0),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/forum_page');
                        },
                        child: const Text("Foro",
                            style:
                                TextStyle(fontSize: 22, color: Colors.black)),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/info_page');
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Image.asset('assets/images/informacion.png',
                              fit: BoxFit.contain, height: 90.0),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/info_page');
                          // Navigator.pushNamed(context, '/change_pass');
                        },
                        child: const Text("Información",
                            style:
                                TextStyle(fontSize: 18, color: Colors.black)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/pharmacy_page');
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Image.asset('assets/images/farmacia.png',
                              fit: BoxFit.contain, height: 90.0),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/pharmacy_page');
                        },
                        child: const Text("Farmacia",
                            style:
                                TextStyle(fontSize: 18, color: Colors.black)),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/pharmacy_page');
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Image.asset('assets/images/marcadormap.png',
                              fit: BoxFit.contain, height: 30.0),
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/clinic_page');
                        },
                        child:Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Image.asset('assets/images/centro_salud.png',
                            fit: BoxFit.contain, height: 90.0),
                      ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/clinic_page');
                        },
                        child:  const Text("Centro de Salud",
                          style: TextStyle(fontSize: 18, color: Colors.black)),
                      ),
                     GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/clinic_page');
                        },
                        child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Image.asset('assets/images/marcadormap.png',
                            fit: BoxFit.contain, height: 30.0),
                      ),
                      ),
                      
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
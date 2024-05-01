// ignore_for_file: unused_element

import 'package:flutter/material.dart';

void main() {
  runApp(report_page());
}

class report_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reporte',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:  ReportPage(),
    );
  }
}

class ReportPage extends StatelessWidget {
  const ReportPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return ReportForm(parentContext: context);
  }
}

class ReportForm extends StatelessWidget {
  final BuildContext parentContext;

  const ReportForm({Key? key, required this.parentContext}) : super(key: key);


  void _handleTextTap(String message) {
    print(message);
    // Aquí puedes poner tu lógica o navegar a otras páginas.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromRGBO(255, 208, 138, 1),
        child: Stack(
          children: [
            const SizedBox(height: 40.0),
            Positioned(
              top: 20.0,
              left: 20.0,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Image.asset(
                      'assets/images/reportar.png',
                      fit: BoxFit.contain,
                      height: 30.0,
                    ),
                  ),
                  const Text(
                    "Reportar",
                    style: TextStyle(fontSize: 22, color: Colors.black),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Expanded(
                  child: SizedBox(),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      CustomPaint(
                        painter: BorderPainter(),
                        child: SizedBox(
                          width: BarReaderSize.width,
                          height: BarReaderSize.height,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  // onTap: () => _handleTextTap("Se hizo tap en 'Reportar'"),
                                  onTap: (){
                                    // Navigator.pushNamed(parentContext, '/sesion_init');
                                       Navigator.of(context, rootNavigator: true).pushNamed("/reportes_page");  
                                  },
                                  child: const Text(
                                    "Reportar",
                                    style: TextStyle(fontSize: 18, color: Colors.black),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.of(context, rootNavigator: true).pushNamed("/reportes_page");  
                                  },
                                  child: const Text(
                                    "usuario con",
                                    style: TextStyle(fontSize: 18, color: Colors.black),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: (){
                                     Navigator.of(context, rootNavigator: true).pushNamed("/reportes_page");  
                                  },
                                  child: const Text(
                                    "palabras",
                                    style: TextStyle(fontSize: 18, color: Colors.black),
                                  ),
                                ),
                                GestureDetector(
                                 onTap: (){
                                   Navigator.of(context, rootNavigator: true).pushNamed("/reportes_page");  
                                  },
                                  child: const Text(
                                    "obscenas",
                                    style: TextStyle(fontSize: 18, color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      CustomPaint(
                        painter: BorderPainter(),
                        child: SizedBox(
                          width: BarReaderSize.width,
                          height: BarReaderSize.height,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: (){
                                     Navigator.of(context, rootNavigator: true).pushNamed("/ChangePassword");  
                                  },
                                  child: const Text(
                                    "Reportar",
                                    style: TextStyle(fontSize: 18, color: Colors.black),
                                  ),
                                ),
                                GestureDetector(
                                 onTap: (){
                                     Navigator.of(context, rootNavigator: true).pushNamed("/ChangePassword");  
                                  },
                                  child: const Text(
                                    "recuperar mi",
                                    style: TextStyle(fontSize: 18, color: Colors.black),
                                  ),
                                ),
                                GestureDetector(
                                 onTap: (){
                                    Navigator.of(context, rootNavigator: true).pushNamed("/ChangePassword");    
                                  },
                                  child: const Text(
                                    "cuenta",
                                    style: TextStyle(fontSize: 18, color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Expanded(
                  child: SizedBox(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final width = 8.0;
    final radius = 30.0;
    final tRadius = 2 * radius;
    final rect = Rect.fromLTWH(
      width,
      width,
      size.width - 2 * width,
      size.height - 2 * width,
    );
    final rrect = RRect.fromRectAndRadius(rect, Radius.zero);

    final clippingRect0 = Rect.fromLTWH(
      0,
      0,
      tRadius,
      tRadius,
    );
    final clippingRect1 = Rect.fromLTWH(
      size.width - tRadius,
      0,
      tRadius,
      tRadius,
    );
    final clippingRect2 = Rect.fromLTWH(
      0,
      size.height - tRadius,
      tRadius,
      tRadius,
    );
    final clippingRect3 = Rect.fromLTWH(
      size.width - tRadius,
      size.height - tRadius,
      tRadius,
      tRadius,
    );

    final path = Path()
      ..addRect(clippingRect0)
      ..addRect(clippingRect1)
      ..addRect(clippingRect2)
      ..addRect(clippingRect3);

    canvas.clipPath(path);
    canvas.drawRRect(
      rrect,
      Paint()
        ..color = Colors.black
        ..style = PaintingStyle.stroke
        ..strokeWidth = width,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class BarReaderSize {
  static double width = 200;
  static double height = 200;
}

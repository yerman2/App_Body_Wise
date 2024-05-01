import 'package:flutter/material.dart';
import 'package:body_wise/pages/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    var d = const Duration(seconds: 4);
    Future.delayed(d, () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const Login()),
          (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromRGBO(255, 208, 138, 1), // Fondo de color amarillo
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(70),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: const CircleAvatar(
                        radius: 110,
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage('assets/images/logo1.png'),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const ListTile(
                      titleTextStyle: TextStyle(color: Colors.white),
                      title: Text(
                        // "Medical App",
                        "BodyWise",
                        style: TextStyle(fontSize: 25),
                        textAlign: TextAlign.center,
                      ),
                      subtitle: Text(
                        "Bienvenido a la app",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const CircularProgressIndicator(
                      color: Colors.indigo,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

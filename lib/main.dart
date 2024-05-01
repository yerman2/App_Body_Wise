// ignore_for_file: unused_import
// Importaciones de Ruta de Archivos
import 'package:body_wise/pages/change/changed_pass.dart';
import 'package:body_wise/pages/change_pass.dart';
import 'package:body_wise/pages/change_user.dart';
import 'package:body_wise/pages/clinic_page.dart';
import 'package:body_wise/pages/forum_page.dart';
import 'package:body_wise/pages/info/condon_page.dart';
import 'package:body_wise/pages/info/ets_page.dart';
import 'package:body_wise/pages/info_page.dart';
import 'package:body_wise/pages/login_page.dart';
import 'package:body_wise/pages/pharmacy_page.dart';
import 'package:body_wise/pages/register_page.dart';
import 'package:body_wise/pages/report/repoted_user.dart';
import 'package:body_wise/pages/report_page.dart';
import 'package:body_wise/pages/save.dart';
import 'package:body_wise/pages/sesion_init.dart';
import 'package:body_wise/pages/splash_screen.dart';
import 'package:flutter/material.dart';

// Importaciones de Firebase
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:body_wise/services/firebase_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
// void main() {
//   runApp(const MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) =>  SplashScreen(),
        '/home':(context) =>  Login(),
        '/register': (context) =>  Register(),
        '/change_pass': (context) =>  ChangePassword(),
        '/sesion_init': (context) =>  sesion_init(),
        '/report_page': (context) => report_page(),
        '/repoted_user': (context) =>  sesion_init(),
        '/forum_page': (context) =>  Forum(),
        '/info_page': (context) =>  Info(),
        '/condon_page': (context) =>  CondonPage(),
        '/ets_page': (context) =>  ETSPage(),
        '/pharmacy_page': (context) =>  PharmacyPage(),
        '/clinic_page': (context) =>  clinic_page(),
        '/change_user': (context) =>  change_user(),
        '/changed_pass': (context) =>  ChangePasswordScreen(),
        '/reportes_page': (context) =>  ChangedP(),

         '/add': (context) =>  add(),
      },
    );
  }
}

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _usuarioController = TextEditingController();
  final TextEditingController _contrasenaController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _errorMessageController = StreamController<String>.broadcast();

  Stream<String> get errorMessageStream => _errorMessageController.stream;

  @override
  void dispose() {
    _errorMessageController.close();
    super.dispose();
  }

  Future<void> _iniciarSesion() async {
    if (_formKey.currentState?.validate() != true) {
      // Las validaciones del formulario fallaron
      return;
    }

    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _usuarioController.text,
        password: _contrasenaController.text,
      );

      print('Inicio de sesión exitoso: ${userCredential.user?.uid}');

      // Aquí puedes navegar a la pantalla deseada después del inicio de sesión exitoso
      Navigator.pushNamed(context, '/sesion_init');
    } catch (e) {
      print('Error al iniciar sesión: $e');
      // Mostrar mensaje de error
      _errorMessageController.add('Correo o contraseña incorrectos');
    }
  }

  Future<void> _vincularCuentaGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
      final OAuthCredential googleCredential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(googleCredential);
      
      print('Inicio de sesión con Google exitoso: ${userCredential.user?.uid}');

      // Aquí puedes navegar a la pantalla deseada después del inicio de sesión exitoso
      Navigator.pushNamed(context, '/sesion_init');
    } catch (e) {
      print('Error al vincular cuenta de Google: $e');
      // Mostrar mensaje de error
      _errorMessageController.add('Error al vincular cuenta de Google');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: LoginForm(
            usuarioController: _usuarioController,
            contrasenaController: _contrasenaController,
            iniciarSesion: _iniciarSesion,
            errorMessageStream: errorMessageStream,
            vincularCuentaGoogle: _vincularCuentaGoogle,
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  final TextEditingController usuarioController;
  final TextEditingController contrasenaController;
  final VoidCallback iniciarSesion;
  final Stream<String> errorMessageStream;
  final VoidCallback vincularCuentaGoogle;

  const LoginForm({
    Key? key,
    required this.usuarioController,
    required this.contrasenaController,
    required this.iniciarSesion,
    required this.errorMessageStream,
    required this.vincularCuentaGoogle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(255, 208, 138, 1),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 40.0),
          Transform.translate(
            offset: const Offset(0, -20),
            child: const CircleAvatar(
              radius: 100,
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage('assets/images/logo1.png'),
            ),
          ),
          const Text(
            'Correo:',
            style: TextStyle(fontSize: 40, color: Colors.black),
          ),
          SizedBox(
            width: 260,
            child: TextFormField(
              controller: usuarioController,
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'El correo es obligatorio';
                } else if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value!)) {
                  return 'Correo inválido';
                }
                return null;
              },
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                hintStyle: TextStyle(color: Colors.black),
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Contraseña:',
            style: TextStyle(fontSize: 40, color: Colors.black),
          ),
          const SizedBox(height: 4),
          SizedBox(
            width: 260,
            child: TextFormField(
              controller: contrasenaController,
              obscureText: true,
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'La contraseña es obligatoria';
                } else if (value!.length < 6) {
                  return 'La contraseña debe tener al menos 6 caracteres';
                }
                return null;
              },
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18.2),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(18.2),
                ),
                hintStyle: const TextStyle(color: Colors.black),
                filled: true,
                fillColor: const Color.fromRGBO(246, 192, 182, 1),
              ),
            ),
          ),
          const SizedBox(height: 15),
          // Sección añadida
          StreamBuilder<String>(
            stream: errorMessageStream,
            builder: (context, snapshot) {
              return Text(
                snapshot.data ?? '',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                ),
              );
            },
          ),
          ElevatedButton(
            onPressed: iniciarSesion,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(const Color.fromRGBO(253, 202, 225, 1)),
              textStyle: MaterialStateProperty.all<TextStyle>(
                const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              ),
            ),
            child: const Text(
              'Iniciar Sesión',
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/change_pass');
                },
                child: const Text(
                  '¿Olvidaste tu usuario o contraseña?',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(width: 16),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
                child: Text(
                  '¿Ya tienes una cuenta? Crea una nueva cuenta',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          // Sección añadida
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     TextButton(
          //       onPressed: vincularCuentaGoogle,
          //       child: const Text(
          //         'Vincular cuenta de Google',
          //         style: TextStyle(
          //           fontSize: 15,
          //           color: Colors.black,
          //         ),
          //       ),
          //     ),
          //     const SizedBox(width: 16),
          //   ],
          // ),
        ],
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _verificationCodeController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cambiar Contraseña con Código'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 40.0),
            // Otros elementos UI...

            // Campo de texto Correo
            _buildTextField('Correo', _emailController),

            const SizedBox(height: 20.0),

            // Campo de texto Nueva Contraseña
            _buildTextField('Nueva Contraseña', _newPasswordController),

            const SizedBox(height: 20.0),

            // Campo de texto Código
            _buildTextField('Código', _verificationCodeController),

            const SizedBox(height: 20.0),

            // Botón de cambio de contraseña
            ElevatedButton(
              onPressed: () {
                _changePassword(context);
              },
              child: const Text('Cambiar Contraseña'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String labelText, TextEditingController controller) {
    return SizedBox(
      width: 260,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10.0),
          Text(
            labelText,
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          TextField(
            controller: controller,
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
        ],
      ),
    );
  }

  Future<void> _changePassword(BuildContext context) async {
    try {
      // Obtener el código correspondiente al correo de Firestore
      QuerySnapshot<Map<String, dynamic>> query = await FirebaseFirestore.instance
          .collection('codigos')
          .where('correo', isEqualTo: _emailController.text)
          .limit(1)
          .get();

      if (query.docs.isNotEmpty) {
        String verificationCode = query.docs.first['codigo'];

        // Comparar el código ingresado con el almacenado en Firestore
        if (_verificationCodeController.text == verificationCode) {
          // Cambiar la contraseña
          await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: _emailController.text, password: verificationCode);

          User? user = FirebaseAuth.instance.currentUser;

          if (user != null) {
            await user.updatePassword(_newPasswordController.text);
          }

          // Borrar el código de la colección 'codigos' en Firestore
          await FirebaseFirestore.instance
              .collection('codigos')
              .doc(query.docs.first.id)
              .delete();

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Contraseña cambiada con éxito'),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Código incorrecto'),
            ),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Correo no encontrado'),
          ),
        );
      }
    } catch (e) {
      print("Error al cambiar la contraseña: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error al cambiar la contraseña'),
        ),
      );
    }
  }
}

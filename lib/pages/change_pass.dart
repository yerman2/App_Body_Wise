import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 208, 138, 1),
      body: Center(
        child: ChangePasswordForm(
          usernameController: _usernameController,
          emailController: _emailController,
          newPasswordController: _newPasswordController,
        ),
      ),
    );
  }
}

class ChangePasswordForm extends StatelessWidget {
  final TextEditingController usernameController;
  final TextEditingController emailController;
  final TextEditingController newPasswordController;

  const ChangePasswordForm({
    Key? key,
    required this.usernameController,
    required this.emailController,
    required this.newPasswordController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
          const SizedBox(height: 40.0),

          // Campo de texto Usuario
          _buildTextField('Usuario', usernameController),

          // Campo de texto Correo
          _buildTextField('Correo', emailController),

          // Campo de texto Nueva Contraseña
          _buildTextField('Nueva Contraseña', newPasswordController, isObscure: true),

          const SizedBox(height: 20.0),

          // Botón de cambio de contraseña con estilo
          buildStyledButton('Cambiar Contraseña', _changePassword, context),
        ],
      ),
    );
  }

  Widget _buildTextField(String labelText, TextEditingController controller,
      {bool isObscure = false}) {
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
            obscureText: isObscure,
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

  Widget buildStyledButton(String buttonText, Function onPressed, BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        if (await doesUserExist(usernameController.text, emailController.text)) {
          onPressed(context);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Usuario y/o correo incorrectos'),
            ),
          );
        }
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(const Color.fromRGBO(253, 202, 225, 1)),
        textStyle: MaterialStateProperty.all<TextStyle>(
          const TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        ),
      ),
      child: Text(
        buttonText,
        style: TextStyle(fontSize: 18, color: Colors.black),
      ),
    );
  }

  Future<bool> doesUserExist(String username, String email) async {
    QuerySnapshot userSnapshot = await FirebaseFirestore.instance
        .collection('usuarios')
        .where('usuario', isEqualTo: username)
        .where('correo', isEqualTo: email)
        .get();

    return userSnapshot.docs.isNotEmpty;
  }

  Future<void> _changePassword(BuildContext context) async {
    try {
      // Consultar la contraseña asociada al usuario y correo electrónico en la base de datos
      QuerySnapshot userSnapshot = await FirebaseFirestore.instance
          .collection('usuarios')
          .where('usuario', isEqualTo: usernameController.text)
          .where('correo', isEqualTo: emailController.text)
          .get();

      // Verificar si se encontró un usuario con ese usuario y correo
      if (userSnapshot.docs.isNotEmpty) {
        // Obtener la referencia al documento del usuario
        DocumentReference userDocRef = userSnapshot.docs.first.reference;

        // Cambiar la contraseña en la base de datos
        await userDocRef.update({'contraseña': newPasswordController.text});

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Contraseña cambiada exitosamente'),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Usuario y/o correo incorrectos'),
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

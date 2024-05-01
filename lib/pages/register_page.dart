import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromRGBO(255, 208, 138, 1),
        child: ListView(
          physics: AlwaysScrollableScrollPhysics(),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          children: [
            const SizedBox(height: 40.0),
            Transform.translate(
              offset: const Offset(0, -20),
              child: CircleAvatar(
                radius: 100,
                backgroundColor: Colors.transparent,
                child: Image(
                  image: AssetImage('assets/images/logo1.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            FormBuilder(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    _buildTextFields('Nombre', 'Apellidos'),

                    _buildTextFields('Edad', 'Teléfono'),

                    _buildTextFields('Correo', 'Usuario'),

                    _buildTextFields('Contraseña', 'Repetir Contraseña'),

                    const SizedBox(height: 20.0),

                    ElevatedButton(
                      onPressed: () {
                        _submitForm(context);
                      },
                      child: const Text('Registrar'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextFields(String label1, String label2, {bool isObscure = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildTextField(label1),
        _buildTextField(label2, isObscure: isObscure),
      ],
    );
  }

  Widget _buildTextField(String labelText, {bool isObscure = false}) {
    return SizedBox(
      width: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10.0),
          Text(
            labelText,
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          FormBuilderTextField(
            obscureText: isObscure,
            name: labelText.toLowerCase(),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Complete \n este campo';
              } else {
                if (labelText == 'Correo' && !RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
                  return 'Correo inválido';
                } else if (labelText == 'Edad' && !RegExp(r"^\d+$").hasMatch(value)) {
                  return 'Edad debe \n contener solo números';
                } else if (labelText == 'Teléfono' && !RegExp(r"^\+?\d+$").hasMatch(value)) {
                  return 'Teléfono no válido';
                } else if ((labelText == 'Nombre' || labelText == 'Apellidos') && RegExp(r"\d").hasMatch(value)) {
                  return 'No debe \n contener números';
                } else if (labelText == 'Contraseña' && value.length < 6) {
                  return 'Mínimo 6 caracteres';
                } else if (labelText == 'Repetir Contraseña' && value != _formKey.currentState!.value['contraseña']) {
                  return 'Deben de coincidir \n las contraseñas';
                }
              }
              return null; // Campo válido
            },
            decoration: const InputDecoration(
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

  void _submitForm(BuildContext context) {
    if (_formKey.currentState!.saveAndValidate() &&
        _formKey.currentState!.value['contraseña'] == _formKey.currentState!.value['repetir contraseña']) {
      _registerUser(_formKey.currentState!.value['correo'], _formKey.currentState!.value['contraseña']);
    }
  }

  void _registerUser(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      print('Usuario registrado: ${userCredential.user?.uid}');

      _saveToDatabase();
    } catch (e) {
      print('Error al registrar usuario: $e');
    }
  }

  void _saveToDatabase() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;

    if (user != null) {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      CollectionReference users = firestore.collection('usuarios');
      Map<String, dynamic> formData = _formKey.currentState!.value;

      try {
        await users.add({
          'nombre': formData['nombre'],
          'apellidos': formData['apellidos'],
          'edad': formData['edad'],
          'telefono': formData['teléfono'],
          'usuario': formData['usuario'], 
          'correo': formData['correo'],
          'contraseña': formData['contraseña'], 
        });

        print("Datos guardados en Firestore con éxito");
      } catch (e) {
        print('Error al guardar en Firestore: $e');
      }
    } else {
      print('Usuario no autenticado');
    }
  }
}

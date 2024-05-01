import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

class ChangedP extends StatefulWidget {
  const ChangedP({Key? key}) : super(key: key);

  @override
  State<ChangedP> createState() => _ChangedPState();
}

class _ChangedPState extends State<ChangedP> {
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
                    _buildTextField('Usuario'),
                    const SizedBox(height: 20.0),
                    _buildTextField('Descripción'),
                    const SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: () {
                        _submitForm(context);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromRGBO(253, 202, 225, 1),
                        textStyle: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 24),
                      ),
                      child: const Text('Guardar Datos'),
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

  Widget _buildTextField(String labelText, {bool isObscure = false}) {
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
          FormBuilderTextField(
            obscureText: isObscure,
            name: labelText.toLowerCase(),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Complete este campo';
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
    if (_formKey.currentState!.saveAndValidate()) {
      _saveToDatabase();
      // Mostrar mensaje de registro exitoso
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Datos guardados exitosamente'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error al guardar, revise los campos del formulario'),
        ),
      );
    }
  }

  void _saveToDatabase() async {
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user = auth.currentUser;

  if (user != null) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference reportes = firestore.collection('reportes'); // Cambio aquí
    Map<String, dynamic> formData = _formKey.currentState!.value;

    try {
      await reportes.add({
        'usuario': formData['usuario'],
        'descripcion': formData['descripción'],
      });

      print("Datos guardados en Firestore con éxito en la colección 'reportes'");
    } catch (e) {
      print('Error al guardar en Firestore: $e');
    }
  } else {
    print('Usuario no autenticado');
  }
}

}

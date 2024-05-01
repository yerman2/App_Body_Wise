// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';

class change_user extends StatefulWidget {
  const change_user({super.key});

  @override
  State<change_user> createState() => _change_userState();
}

class _change_userState extends State<change_user> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 208, 138, 1),
      body: Center(
        child: ChangeForm(),
      ),
    );
  }
}

class ChangeForm extends StatelessWidget {
  const ChangeForm({super.key});

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
          _buildTextField('Usuario'),

          // Campo de texto Correo
          _buildTextField('Correo'),

          const SizedBox(height: 20.0),

          // Texto de recuperación

          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/change_pass');
            },
            child: const Text(
              '¿Ha olvidado su Clave?',
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
          ),

          const SizedBox(height: 20.0),

          // Botón de recuperación
          ElevatedButton(
            onPressed: () {
              // Lógica para recuperar aquí
            },
            child: const Text('Recuperar'),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String labelText) {
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
}

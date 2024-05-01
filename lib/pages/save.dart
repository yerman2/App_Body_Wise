
import 'package:body_wise/services/firebase_service.dart';
import 'package:flutter/material.dart';

class add extends StatefulWidget {
  const add({super.key});

  @override
  State<add> createState() => _addState();
}

class _addState extends State<add> {

  TextEditingController nameController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
  return Scaffold(appBar: AppBar(
    title: const Text('Guardar Data Nueva'),
  ),
  body:  Padding(
    padding: const EdgeInsets.all(15.0),
    child: Column(
      children: [
         TextField(
          controller: nameController,
          decoration: const InputDecoration(
            hintText: 'Ingres su nombre',
          ),
        ),
        ElevatedButton(onPressed: () async{
          await addUsers(nameController.text).then((value) {
            Navigator.pop(context);
          });
        }, child: const Text("Guardar"))
      ],
    ),
  ),
  );
  }
}
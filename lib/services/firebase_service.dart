import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getUsers() async {
  List users = [];

  CollectionReference collectionReferenceUsuarios = db.collection('usuarios');

  QuerySnapshot queryUsuario = await collectionReferenceUsuarios.get();

  queryUsuario.docs.forEach((documento) {
    users.add(documento.data());
  });
  return users;
}

Future<void> addUsers(String name) async {

  await db.collection("usuarios").add({"name": name});

}

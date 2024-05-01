// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_local_variable

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

class Message {
  final String userId;
  final String messageText;
  final Timestamp timestamp;
  final String lastFourDigits;

  Message({
    required this.userId,
    required this.messageText,
    required this.timestamp,
    required this.lastFourDigits,
  });
}

class Forum extends StatefulWidget {
  const Forum({Key? key}) : super(key: key);

  @override
  _ForumState createState() => _ForumState();
}

class _ForumState extends State<Forum> {
  final TextEditingController _messageController = TextEditingController();
  final StreamController<void> _refreshController =
      StreamController<void>.broadcast();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    _messageController.dispose();
    _refreshController.close();
    super.dispose();
  }

  Future<String?> _getCurrentUserId() async {
    final User? user = _auth.currentUser;
    return user?.uid;
  }

  void _sendMessage() async {
    final String? userId = await _getCurrentUserId();
    final String messageText = _messageController.text.trim();

    if (userId != null && messageText.isNotEmpty) {
      final String lastFourDigits = userId.length > 4
          ? userId.substring(userId.length - 4)
          : userId;

      // Obtén la marca de tiempo actual en Dart antes de enviarla a Firestore
      final Timestamp timestamp = Timestamp.now();

      await FirebaseFirestore.instance.collection('messages').add({
        'userId': userId,
        'lastFourDigits': lastFourDigits,
        'messageText': messageText,
        'timestamp': timestamp,
      });

      _messageController.clear();
      _refreshController
          .add(null); // Notificar al StreamBuilder que debe volver a cargar los mensajes
    }
  }

  String _getUserNameFromMessage(Map<String, dynamic> message) {
    if (message.containsKey('userId') && message.containsKey('lastFourDigits')) {
      final userId = message['userId'];
      final lastFourDigits = message['lastFourDigits'];
      return 'usuario anonimo@$lastFourDigits';
    }
    return 'usuario anonimo';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 208, 138, 1),
      body: Column(
        children: [
       Padding(
  padding: EdgeInsets.fromLTRB(
    16.0,
    MediaQuery.of(context).padding.top + 8.0,
    16.0,
    16.0,
  ),
  child: GestureDetector(
    onTap: () {
      print('Clic en Regresar');
      // Agrega aquí la lógica para regresar
      Navigator.pop(context);
    },
    child: Row(
      children: [
        Icon(Icons.arrow_back),
        const SizedBox(width: 16.0),
        Text(
          'Regresar',
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
      ],
    ),
  ),
),


          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('messages')
                  .orderBy('timestamp',
                      descending:
                          true) // Ordena por timestamp de forma descendente
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(child: Text('No hay mensajes aún.'));
                }

                final messages = snapshot.data!.docs;

                return ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final message =
                        messages[index].data() as Map<String, dynamic>;

                    if (message.containsKey('userId') &&
                        message.containsKey('messageText') &&
                        message.containsKey('timestamp')) {
                      final userName = _getUserNameFromMessage(message);
                      return MessageCard(
                        userName: userName,
                        messageText: message['messageText'],
                        timestamp: message['timestamp'],
                      );
                    } else {
                      return Container(
                        color: Colors.red,
                        child: ListTile(
                          title: Text('Error en los datos'),
                        ),
                      );
                    }
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextField(
                  controller: _messageController,
                  onSubmitted: (_) {
                    _sendMessage();
                  },
                  decoration: InputDecoration(
                    hintText: 'Escribe algo....',
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 12,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 56, 55, 55),
                        width: 12,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 2,
                      ),
                    ),
                  ),
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MessageCard extends StatelessWidget {
  final String userName;
  final String messageText;
  final Timestamp timestamp;

  const MessageCard({
    required this.userName,
    required this.messageText,
    required this.timestamp,
  });

  @override
  Widget build(BuildContext context) {
    // Convierte la marca de tiempo a un objeto DateTime y luego a la zona horaria local
    final localDateTime = timestamp.toDate().toLocal();
    // Formatea la fecha y la hora según el formato deseado
    final formattedDate = DateFormat('dd-MM-yyyy').format(localDateTime);
    final formattedTime = DateFormat('hh:mm a').format(localDateTime);

    return Card(
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 32, // 16 * 2 (padding horizontal)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.account_circle),
                  const SizedBox(width: 8.0),
                  Text(userName,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.message),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: Text(
                      'Dice: $messageText',
                      style: TextStyle(fontSize: 16),
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Align(
                alignment: Alignment.topRight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      formattedDate,
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      formattedTime,
                      style: TextStyle(fontSize: 14),
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

void main() {
  runApp(MaterialApp(
    home: Forum(),
  ));
}

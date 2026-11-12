
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'firebase_options.dart';
import 'inicio.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  try {
    print('TESTANDO CONEXÃO COM FIRESTORE...');

    await FirebaseFirestore.instance
        .collection('Teste')
        .limit(1)
        .get()
        .timeout(const Duration(seconds: 15));

    print('CONEXÃO COM FIRESTORE FUNCIONOU!');
  } catch (e) {
    print('FALHA NA CONEXÃO COM FIRESTORE: $e');
  }

  runApp(const EBX());
}

class EBX extends StatelessWidget {
  const EBX({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EBX',
      theme: ThemeData(
        primaryColor: const Color(0xFFFFC107),
        useMaterial3: true,
      ),
      home: const Inicio(),
    );
  }
}

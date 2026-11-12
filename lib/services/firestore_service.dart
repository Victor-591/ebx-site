
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/mensagens.dart';

class FirestoreService {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<void> salvarMensagem(Mensagens mensagem) async {
    try {
      print('Tentando conectar ao Firestore...');

      final documento = await db
          .collection('orcamentos')
          .add(mensagem.toMap())
          .timeout(const Duration(seconds: 15));

      print('Mensagem salva com sucesso!');
      print('ID do documento: ${documento.id}');
    } catch (e) {
      print('ERRO NO FIRESBASE: $e');
      rethrow;
    }
  }
}


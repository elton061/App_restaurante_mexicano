import 'package:projeto_p1/classe/itemPedido.dart';

class Pedido {
  final String uid;
  final String status;
  final DateTime dataHora;  // Tipo DateTime para armazenar a data e hora
  final List<ItemPedido> itens;

  Pedido({
    required this.uid,
    required this.status,
    required this.dataHora,
    required this.itens,
  });

  // Converte os dados para o formato que será salvo no Firestore
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'status': status,
      'data_hora': dataHora.toIso8601String(),  // Convertendo a data para ISO8601
      'itens': itens.map((item) => item.toMap()).toList(),
    };
  }
}

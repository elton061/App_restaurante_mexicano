class ItemPedido {
  final String nome;
  final double preco;
  final int quantidade;

  ItemPedido({
    required this.nome,
    required this.preco,
    required this.quantidade,
  });

  // Converte os dados para o formato que será salvo no Firestore
  Map<String, dynamic> toMap() {
    return {
      'item_nome': nome,  // Mudança para 'item_nome'
      'preco': preco,
      'quantidade': quantidade,
    };
  }
}

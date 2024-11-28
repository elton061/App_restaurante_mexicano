class Produto {
  final double preco;
  final String nome;
  final String descricao;  // Adicionado campo descricao
  final String imagem;     // Adicionado campo imagem

  Produto(this.preco, this.nome, {required this.descricao, required this.imagem});
}

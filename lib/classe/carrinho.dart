import 'produto.dart';

class Carrinho {
  final List<Produto> _produtos = [];

  void adicionarProduto(Produto produto) {
    _produtos.add(produto);
  }

  void limpar() {
    produtos.clear();
  }

  List<Produto> get produtos => _produtos;

  double get total => _produtos.fold(0, (sum, item) => sum + item.preco);
}

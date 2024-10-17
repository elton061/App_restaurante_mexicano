import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:projeto_p1/classe/carrinho.dart';

class TelaCarrinho extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final carrinho = GetIt.I<Carrinho>(); // Acesse o carrinho através do GetIt

    return Scaffold(
      appBar: AppBar(
        title: Text('Carrinho de Compras'),
        backgroundColor: Colors.yellow,
      ),
      body: Container(
        color: const Color.fromARGB(255, 253, 246, 237),
        child: Builder(
          builder: (context) {
            Widget corpo;
            if (carrinho.produtos.isEmpty) {
              // Verifica se o carrinho está vazio
              corpo = Center(
                child: Text(
                  'Seu carrinho está vazio.',
                  style: TextStyle(fontSize: 20),
                ),
              );
            } else {
              corpo = Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: carrinho.produtos
                          .length, // limita ao número total de produtos no carrinho
                      itemBuilder: (context, index) {
                        final produto = carrinho.produtos[index];
                        return ListTile(
                          title: Text(
                            produto.nome,
                            style: TextStyle(fontSize: 30),
                          ),
                          subtitle: Text(
                            'Preço: R\$ ${produto.preco.toStringAsFixed(2)}',
                            style: TextStyle(fontSize: 18),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Total: R\$ ${carrinho.total.toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('O pedido foi confirmado!')));

                      carrinho
                          .limpar(); // para limpar o carrinho apos finalizar o pedido

                      (context as Element)
                          .markNeedsBuild(); // atualiza o carrinho
                    },
                    child: Text('Finalizar Pedido'),
                  ),
                ],
              );
            }

            // Retorna o corpo definido acima
            return corpo;
          },
        ),
      ),
    );
  }
}

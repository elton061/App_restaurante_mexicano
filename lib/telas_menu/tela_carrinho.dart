import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Importando o FirebaseAuth
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:projeto_p1/classe/carrinho.dart';
import 'package:projeto_p1/classe/itemPedido.dart';
import 'package:projeto_p1/classe/pedido.dart';

class TelaCarrinho extends StatelessWidget {
  const TelaCarrinho({super.key});

  @override
  Widget build(BuildContext context) {
    final carrinho = GetIt.I<Carrinho>(); // Acessa o carrinho através do GetIt

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
                      itemCount: carrinho.produtos.length,
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
                    onPressed: () async {
                      // Obtendo o usuário logado
                      final user = FirebaseAuth.instance.currentUser;
                      if (user == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Você precisa estar logado!')),
                        );
                        return;
                      }

                      final uid = user.uid; // Pega o UID do usuário logado

                      // Criando o pedido com os dados do carrinho
                      final pedido = Pedido(
                        uid: uid,  // Usando o UID do usuário autenticado
                        status: 'finalizado',  // Status finalizado
                        dataHora: DateTime.now(), // Usando a data e hora atual
                        itens: carrinho.produtos.map((produto) {
                          return ItemPedido(
                            nome: produto.nome,  
                            preco: produto.preco,
                            quantidade: 1,  // Para simplificação, quantidade é 1
                          );
                        }).toList(),
                      );

                      // Adicionando o pedido na coleção 'pedidos' no Firestore
                      final pedidoRef = FirebaseFirestore.instance.collection('pedidos');
                      final pedidoDoc = await pedidoRef.add(pedido.toMap());

                      // Adicionando os itens na subcoleção 'itens' do pedido
                      for (var item in pedido.itens) {
                        await pedidoDoc.collection('itens').add(item.toMap());
                      }

                      // Limpar o carrinho após o pedido
                      carrinho.limpar();

                      // Exibe a mensagem e atualiza a tela
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('O pedido foi confirmado!')));
                    },
                    child: Text('Finalizar Pedido'),
                  ),
                ],
              );
            }

            return corpo;
          },
        ),
      ),
    );
  }
}

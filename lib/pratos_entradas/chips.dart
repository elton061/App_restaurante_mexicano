import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:projeto_p1/classe/carrinho.dart';
import 'package:projeto_p1/classe/produto.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Chips extends StatelessWidget {
  Chips({super.key});

  // Método para buscar os dados do chips no Firestore
  Future<Produto> _getChipsDetails() async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    try {
      // Buscando pelo nome do produto "Chips"
      final querySnapshot = await firestore
          .collection('itens_cardapio')
          .where('nome', isEqualTo: 'Chips') // Filtrando pelo nome
          .get();

      // Verifica se algum documento foi encontrado
      if (querySnapshot.docs.isNotEmpty) {
        final data = querySnapshot.docs.first.data();
        return Produto(
          data['preco'],
          data['nome'],
          descricao: data['descricao'],
          imagem: data['imagem'], // URL da imagem
        );
      } else {
        throw Exception('Produto não encontrado');
      }
    } catch (e) {
      print('Erro ao buscar dados do Firestore: $e');
      throw Exception('Erro ao buscar dados do Firestore');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text(
          'Chips',
          style: TextStyle(fontSize: 30, color: Colors.black),
        ),
      ),
      body: FutureBuilder<Produto>(
        future: _getChipsDetails(), // Chama a função para pegar os dados do Firestore
        builder: (context, snapshot) {
          // Depuração do estado da conexão
          print("Estado da conexão: ${snapshot.connectionState}");

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            print('Erro: ${snapshot.error}');
            return Center(child: Text('Erro ao carregar o Chips.'));
          }

          if (!snapshot.hasData) {
            return Center(child: Text('Chips não encontrado.'));
          }

          final chips = snapshot.data!;
          print("Produto carregado: ${chips.nome}");

          return Container(
            color: const Color.fromARGB(255, 245, 216, 174), // container de fundo
            child: Column(
              children: [
                // Exibindo a imagem do produto
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    chips.imagem, // URL da imagem
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 335,
                    width: 400,
                    color: Colors.grey, // container com o texto
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '${chips.nome}\n${chips.descricao}', // Exibindo a descrição
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Preço: R\$ ${chips.preco.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontSize: 20,
                              color: const Color.fromARGB(255, 121, 15, 7),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                    backgroundColor: const Color.fromARGB(255, 228, 40, 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    'Adicionar ao carrinho',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 238, 236, 236),
                      fontSize: 25,
                    ),
                  ),
                  onPressed: () {
                    GetIt.I<Carrinho>().adicionarProduto(chips);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('${chips.nome} adicionado ao carrinho'),
                    ));
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

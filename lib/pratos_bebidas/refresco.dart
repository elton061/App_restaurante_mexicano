import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:projeto_p1/classe/carrinho.dart';
import 'package:projeto_p1/classe/produto.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Refresco extends StatelessWidget {
  Refresco({super.key});

  // Método para buscar os dados do refresco no Firestore
  Future<Produto> _getRefrescoDetails() async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    try {
      // Usando a consulta para buscar pelo nome do produto
      final querySnapshot = await firestore
          .collection('itens_cardapio')
          .where('nome', isEqualTo: 'Refresco') // Filtra pelo campo 'nome'
          .limit(1)  // Garantir que traga apenas um documento
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        final data = querySnapshot.docs.first.data()!;
        print('Dados do Firestore: $data');  // Exibindo os dados recebidos do Firestore

        return Produto(
          data['preco'],       // Preço
          data['nome'],        // Nome
          descricao: data['descricao'],  // Descrição
          imagem: data['imagem'],        // URL da imagem
        );
      } else {
        print('Produto não encontrado');
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
          'Refresco de hibisco',
          style: TextStyle(fontSize: 30, color: Colors.black),
        ),
      ),
      body: FutureBuilder<Produto>(
        future: _getRefrescoDetails(), // Chama a função para pegar os dados do Firestore
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Erro ao carregar o refresco.'));
          }

          if (!snapshot.hasData) {
            return Center(child: Text('Refresco não encontrado.'));
          }

          final refresco = snapshot.data!;

          return Container(
            color: const Color.fromARGB(255, 245, 216, 174), // container de fundo
            child: Column(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(
                      refresco.imagem, // Usando a URL da imagem
                    ),
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
                            '${refresco.nome}\n${refresco.descricao}', // Exibindo a descrição
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Preço: R\$ ${refresco.preco.toStringAsFixed(2)}',
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
                    GetIt.I<Carrinho>().adicionarProduto(refresco);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('${refresco.nome} adicionado ao carrinho'),
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

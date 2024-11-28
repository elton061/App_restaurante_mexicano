import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:projeto_p1/classe/carrinho.dart';
import 'package:projeto_p1/classe/produto.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FlanMexicano extends StatelessWidget {
  FlanMexicano({super.key});

  // Método para buscar os dados do Flan Mexicano no Firestore
  Future<Produto> _getFlanDetails() async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    try {
      // Usando a consulta para buscar pelo nome do produto com "ç" correto
      final querySnapshot = await firestore
          .collection('itens_cardapio')
          .where('nome', isEqualTo: 'Flan Mexicano') // Nome com "ç" corretamente
          .limit(1)  // Garantir que traga apenas um documento
          .get();

      print('Consulta executada. Total de documentos encontrados: ${querySnapshot.docs.length}');

      if (querySnapshot.docs.isNotEmpty) {
        final data = querySnapshot.docs.first.data()!;
        print('Dados do Firestore: $data');  // Exibindo os dados recebidos do Firestore

        // Validar se o campo 'imagem' está presente e não é nulo
        String imagemUrl = data['imagem'] ?? 'https://default-image-url.com/default.jpg';  // URL padrão caso a imagem seja nula

        return Produto(
          data['preco'],       // Preço
          data['nome'],        // Nome
          descricao: data['descricoes'],  // Descrição
          imagem: imagemUrl,   // URL da imagem
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
          'Flan Mexicano',
          style: TextStyle(fontSize: 30, color: Colors.black),
        ),
      ),
      body: FutureBuilder<Produto>(
        future: _getFlanDetails(), // Chama a função para pegar os dados do Firestore
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            print('Erro no FutureBuilder: ${snapshot.error}');
            return Center(child: Text('Erro ao carregar o Flan Mexicano.'));
          }

          if (!snapshot.hasData) {
            print('Dados não encontrados');
            return Center(child: Text('Flan Mexicano não encontrado.'));
          }

          final flanMexicano = snapshot.data!;

          return Container(
            color: const Color.fromARGB(255, 245, 216, 174), // container de fundo
            child: Column(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(
                      flanMexicano.imagem, // Usando a URL da imagem do Firestore
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
                            '${flanMexicano.nome}\n${flanMexicano.descricao}', // Exibindo a descrição
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Preço: R\$ ${flanMexicano.preco.toStringAsFixed(2)}',
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
                    GetIt.I<Carrinho>().adicionarProduto(flanMexicano);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('${flanMexicano.nome} adicionado ao carrinho'),
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

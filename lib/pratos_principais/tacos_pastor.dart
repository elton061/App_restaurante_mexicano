import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:projeto_p1/classe/carrinho.dart';
import 'package:projeto_p1/classe/produto.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TacosPastor extends StatelessWidget {
  TacosPastor({super.key});

  // Método para buscar os dados do Tacos no Firestore usando o campo 'nome'
  Future<Produto> _getTacosDetails() async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    try {
      // Buscando na coleção 'itens_cardapio' onde o campo 'nome' seja 'Tacos'
      final querySnapshot = await firestore
          .collection('itens_cardapio')
          .where('nome', isEqualTo: 'Tacos') // Filtra o documento com nome igual a "Tacos"
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        // Pega o primeiro documento da lista de resultados
        final data = querySnapshot.docs[0].data();
        return Produto(
          data['preco'],       // Preço
          data['nome'],        // Nome
          descricao: data['descricao'],  // Descrição
          imagem: data['imagem'],        // URL da imagem
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
          'Tacos Al Pastor',
          style: TextStyle(fontSize: 30, color: Colors.black),
        ),
      ),
      body: FutureBuilder<Produto>(
        future: _getTacosDetails(), // Chama a função para pegar os dados do Firestore
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Erro ao carregar os Tacos: ${snapshot.error}'));
          }

          if (!snapshot.hasData) {
            return Center(child: Text('Tacos não encontrados.'));
          }

          final tacos = snapshot.data!;

          return Container(
            color: const Color.fromARGB(255, 245, 216, 174), // container de fundo
            child: SingleChildScrollView( // Permite rolagem caso o conteúdo seja maior que a tela
              child: Column(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: tacos.imagem.isNotEmpty
                          ? Image.network(tacos.imagem)
                          : Icon(Icons.error, color: Colors.red, size: 100), // Exibe ícone de erro se a imagem não for carregada
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.grey, // container com o texto
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '${tacos.nome}\n${tacos.descricao}', // Exibindo a descrição
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Preço: R\$ ${tacos.preco.toStringAsFixed(2)}',
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
                      GetIt.I<Carrinho>().adicionarProduto(tacos);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('${tacos.nome} adicionado ao carrinho'),
                      ));
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

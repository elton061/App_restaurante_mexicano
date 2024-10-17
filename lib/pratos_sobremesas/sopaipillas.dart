import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:projeto_p1/classe/carrinho.dart';
import 'package:projeto_p1/classe/produto.dart';

class Sopaipillas extends StatelessWidget {
  final Produto sopaipillas = Produto(10.00, 'Sopaipillas com mel');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow,
          title: Text(
            'Sopaipillas',
            style: TextStyle(fontSize: 30, color: Colors.black),
          ),
        ),
        body: Container(
            color:
                const Color.fromARGB(255, 245, 216, 174), // container de fundo
            child: Column(
              children: [
                Center(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'sopaipillas.jpg',
                  ),
                )),
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
                                'Sopaipillas com Mel\nDeliciosas massas fritas, levemente crocantes por fora e macias por dentro, polvilhadas com açúcar e '
                                'canela. Servidas com mel para mergulhar, criando uma combinação irresistível de doçura e textura. Uma sobremesa simples e '
                                'tradicional, perfeita para fechar a refeição com chave de ouro.'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Preço: 10,00 Reais',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: const Color.fromARGB(255, 121, 15, 7)),
                            ),
                          ),
                        ],
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                TextButton(
                    style: TextButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                      backgroundColor: const Color.fromARGB(255, 228, 40, 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text('Adicionar ao carrinho',
                        style: TextStyle(
                          color: const Color.fromARGB(255, 238, 236, 236),
                          fontSize: 25,
                        )),
                    onPressed: () {
                      GetIt.I<Carrinho>().adicionarProduto(sopaipillas);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                              '${sopaipillas.nome} adicionado ao carrinho')));
                    })
              ],
            )));
  }
}

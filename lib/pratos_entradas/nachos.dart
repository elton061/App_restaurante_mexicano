import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:projeto_p1/classe/carrinho.dart';
import 'package:projeto_p1/classe/produto.dart';

class Nachos extends StatelessWidget {
  final Produto nachos = Produto(20.00, 'Nachos clássicos');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow,
          title: Text(
            'Nachos Clássicos',
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
                    'nachos.jpg',
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
                                'Nachos Clássicos \nChips de tortilha crocantes cobertos com uma generosa camada de queijo derretido, complementados com jalapeños picantes, '
                                'guacamole cremoso, feijão temperado e carne moída suculenta. Finalizados com uma porção de creme azedo, os nachos oferecem uma perfeita combinação '
                                'de texturas e sabores, proporcionando uma experiência deliciosa e ideal para compartilhar.'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Preço: 20,00 Reais',
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
                      GetIt.I<Carrinho>().adicionarProduto(nachos);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content:
                              Text('${nachos.nome} adicionado ao carrinho')));
                    })
              ],
            )));
  }
}

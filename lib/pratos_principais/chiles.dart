import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:projeto_p1/classe/carrinho.dart';
import 'package:projeto_p1/classe/produto.dart';

class Chiles extends StatelessWidget {
  final Produto chiles = Produto(37.00, 'Chiles en Nogada');

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
        body: Container(
            color:
                const Color.fromARGB(255, 245, 216, 174), // container de fundo
            child: Column(
              children: [
                Center(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset('chiles.jpg'),
                )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      height: 300,
                      width: 400,
                      color: Colors.grey, // container com o texto
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                'Chiles en Nogada é um prato tradicional mexicano que apresenta pimentões poblanos assados e descascados, recheados com carne moída,'
                                'frutas picadas e especiarias. Cobertos com um cremoso molho de nozes, ele combina sabores doces e salgados. Para finalizar, são polvilhados '
                                'com grãos de romã, que adicionam frescor e textura. É um prato emblemático, especialmente apreciado durante as festividades do Dia da Independência do México.'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Preço: 37,00 Reais',
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
                      GetIt.I<Carrinho>().adicionarProduto(chiles);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content:
                              Text('${chiles.nome} adicionado ao carrinho')));
                    })
              ],
            )));
  }
}

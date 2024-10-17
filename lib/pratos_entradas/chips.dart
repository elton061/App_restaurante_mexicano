import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:projeto_p1/classe/carrinho.dart';
import 'package:projeto_p1/classe/produto.dart';

class Chips extends StatelessWidget {
  final Produto chips = Produto(15.00, 'Chips com salsa');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow,
          title: Text(
            'Chips c/ salsa',
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
                    'chips.jpg',
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
                                'Chips de Tortilha com Salsa são um aperitivo popular na culinária mexicana. Os chips são feitos a partir de tortilhas de milho cortadas '
                                'em triângulos e fritas até ficarem crocantes e douradas. Eles são servidos quentes, acompanhados de uma salsa fresca, que pode ser feita '
                                'com tomates, cebolas, coentro, pimentas e limão. A combinação da crocância dos chips com a frescura e o sabor picante da salsa cria um lanche '
                                'irresistível e perfeito para compartilhar. É uma opção ideal para festas ou como entrada em refeições.'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Preço: 15,00 Reais',
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
                      GetIt.I<Carrinho>().adicionarProduto(chips);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content:
                              Text('${chips.nome} adicionado ao carrinho')));
                    })
              ],
            )));
  }
}

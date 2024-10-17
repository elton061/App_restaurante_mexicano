import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:projeto_p1/classe/carrinho.dart';
import 'package:projeto_p1/classe/produto.dart';

class TacosPastor extends StatelessWidget {
  final Produto tacos = Produto(26.70, 'Tacos El Pastor');

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
                  child: Image.asset('tacos.jpg'),
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
                                'Um clássico da culinária mexicana, os Tacos al Pastor são preparados com carne de porco marinada em uma mistura de temperos tradicionais, '
                                'incluindo pimenta, achiote e ervas, que conferem um sabor único e marcante. A carne é assada lentamente no espeto, garantindo suculência e '
                                'uma crosta dourada. Servidos em pequenas tortillas de milho macias e quentes, os tacos são recheados com pedaços de abacaxi grelhado, que adiciona '
                                'um toque agridoce, além de cebola picada e coentro fresco, proporcionando frescor e equilíbrio. Para finalizar, uma pitada de limão e salsa à parte '
                                'para ajustar o nível de pimenta a gosto. Uma explosão de sabores em cada mordida.'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Preço: 26,70 Reais',
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
                      GetIt.I<Carrinho>().adicionarProduto(tacos);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content:
                              Text('${tacos.nome} adicionado ao carrinho')));
                    })
              ],
            )));
  }
}

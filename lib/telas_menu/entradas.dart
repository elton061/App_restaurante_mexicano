import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projeto_p1/pratos_entradas/chips.dart';
import 'package:projeto_p1/pratos_entradas/guacamole.dart';
import 'package:projeto_p1/pratos_entradas/nachos.dart';
import 'package:projeto_p1/pratos_entradas/sopes.dart';

class Entradas extends StatelessWidget {
  const Entradas({super.key});

  // Função para buscar as entradas do Firestore
  Future<List<Map<String, dynamic>>> _getEntradas() async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final snapshot = await firestore
        .collection('itens_cardapio')
        .where('categoria', isEqualTo: 'Entradas')
        .get();

    // Mapeando os dados para uma lista de mapas
    return snapshot.docs.map((doc) {
      return {
        'nome': doc['nome'],
        'pagina': _getPageForEntrada(doc['nome']),
      };
    }).toList();
  }

  // Função para retornar a página específica de cada entrada
  Widget _getPageForEntrada(String entrada) {
    switch (entrada) {
      case 'Guacamole':
        return Guacamole();
      case 'Nachos clássicos':
        return Nachos();
      case 'Sopes':
        return Sopes();
      case 'Chips com salsa':
        return Chips();
      default:
        return Scaffold(body: Center(child: Text('Página não encontrada')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text('Entradas', style: TextStyle(fontSize: 24, color: Colors.black)),
      ),
      body: Container(
        color: const Color.fromARGB(255, 250, 212, 162),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder<List<Map<String, dynamic>>>(
            future: _getEntradas(), // Chama a função que pega as entradas do Firestore
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                return Center(child: Text('Erro ao carregar entradas.'));
              }

              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(child: Text('Nenhuma entrada encontrada.'));
              }

              // Lista de entradas do Firestore
              final entradas = snapshot.data!;

              return ListView(
                children: [
                  Center(
                    child: Text(
                      'Entradas',
                      style: TextStyle(
                        fontSize: 40,
                        color: const Color.fromARGB(255, 65, 47, 20),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: entradas.map((entrada) {
                      return Column(
                        children: [
                          Container(
                            width: 400,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                                backgroundColor: const Color.fromARGB(255, 211, 32, 19),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Text(
                                entrada['nome'],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => entrada['pagina'],
                                ));
                              },
                            ),
                          ),
                          SizedBox(height: 30),
                        ],
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 120),
                  Image.asset(
                    'assets/telaMenu.png',
                    height: 200,
                    width: 300,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

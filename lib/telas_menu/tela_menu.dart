import 'package:flutter/material.dart';
import 'package:projeto_p1/telas_menu/bebidas.dart';
import 'package:projeto_p1/telas_menu/entradas.dart';
import 'package:projeto_p1/telas_menu/p_principais.dart';
import 'package:projeto_p1/telas_menu/sobremesas.dart';
import 'package:projeto_p1/telas_menu/tela_carrinho.dart';
import '../telas_login/login1.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TelaMenu extends StatelessWidget {
  Future<List<Map<String, dynamic>>> _getCategorias() async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final snapshot = await firestore.collection('categorias').get();

    return snapshot.docs.map((doc) {
      return {
        'nome': doc['nome'] ?? '',  // Garantir que o valor não seja nulo
        'descricao': doc['descricao'] ?? '', // Garantir que o valor não seja nulo
        'ordem': doc['ordem'] ?? 0, // Garantir que ordem tenha um valor padrão
      };
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu',
            style: TextStyle(
              fontSize: 30,
              color: const Color.fromARGB(255, 0, 120, 218),
            )),
        backgroundColor: const Color.fromARGB(255, 247, 224, 21),
      ),
      body: Container(
        color: const Color.fromARGB(255, 250, 212, 162),
        height: 800,
        width: 500,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 500,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton(
                      child: Icon(Icons.logout, size: 30, color: Colors.black),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Login1()));
                      }),
                  SizedBox(width: 250),
                  TextButton(
                      child: Icon(Icons.shopping_cart_sharp,
                          size: 30, color: Colors.black),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => TelaCarrinho()));
                      }),
                ],
              ),
            ),
            SizedBox(height: 40),
            FutureBuilder<List<Map<String, dynamic>>>(
              future: _getCategorias(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Center(child: Text('Erro ao carregar categorias'));
                }

                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('Nenhuma categoria encontrada'));
                }

                final categorias = snapshot.data!;

                return Column(
                  children: categorias.map((categoria) {
                    return Column(
                      children: [
                        SizedBox(
                          width: 300,
                          child: TextButton(
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 25),
                                backgroundColor:
                                    const Color.fromARGB(255, 211, 32, 19),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Text(categoria['nome'],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                  )),
                              onPressed: () {
                                if (categoria['nome'] == 'Entradas') {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => Entradas()));
                                } else if (categoria['nome'] == 'Principais') {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => Pprincipais()));
                                } else if (categoria['nome'] == 'Sobremesas') {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => Sobremesas()));
                                } else if (categoria['nome'] == 'Bebidas') {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => Bebidas()));
                                }
                              }),
                        ),
                        SizedBox(height: 30),
                      ],
                    );
                  }).toList(),
                );
              },
            ),
            SizedBox(height: 60),
            Center(
              child: Image.asset(
                'assets/telaMenu.png',
                height: 120,
                width: 180,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

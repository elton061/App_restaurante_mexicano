import 'package:flutter/material.dart';
import 'package:projeto_p1/telas_menu/bebidas.dart';
import 'package:projeto_p1/telas_menu/entradas.dart';
import 'package:projeto_p1/telas_menu/p_principais.dart';
import 'package:projeto_p1/telas_menu/sobremesas.dart';
import 'package:projeto_p1/telas_menu/tela_carrinho.dart';
import '../telas_login/login1.dart';

class TelaMenu extends StatelessWidget {
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
                            builder: (context) =>
                                Login1())); // onPressed temporario
                      }),
                  SizedBox(width: 250),
                  TextButton(
                      child: Icon(Icons.shopping_cart_sharp,
                          size: 30, color: Colors.black),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                TelaCarrinho())); // onPressed temporario
                      }),
                ],
              ),
            ),
            SizedBox(height: 40),
            Column(
              children: [
                Container(
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
                        child: Text('Entradas',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                            )),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Entradas()));
                        })),
                SizedBox(height: 30),
                Container(
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
                        child: Text('Principais',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                            )),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Pprincipais()));
                        })),
                SizedBox(height: 40),
                Container(
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
                        child: Text('Sobremesas',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                            )),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Sobremesas()));
                        })),
                SizedBox(
                  height: 40,
                ),
                Container(
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
                        child: Text('Bebidas',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                            )),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Bebidas()));
                        })),
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
          ],
        ),
      ),
    );
  }
}

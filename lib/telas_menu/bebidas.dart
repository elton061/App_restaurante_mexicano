import 'package:flutter/material.dart';
import 'package:projeto_p1/pratos_bebidas/refresco.dart';
import 'package:projeto_p1/pratos_bebidas/suco_t.dart';

class Bebidas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow,
        ),
        body: Container(
            // container principal
            color: const Color.fromARGB(255, 250, 212, 162),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  Center(
                    child: Text(
                      'Bebidas',
                      style: TextStyle(
                        fontSize: 40,
                        color: const Color.fromARGB(255, 65, 47, 20),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment
                        .center, // Coluna para exibir os pratos
                    children: [
                      Container(
                          //Tacos
                          width: 400,
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
                              child: Text('Suco',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                  )),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => SucoT()));
                              })),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                          //burrito
                          width: 400,
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
                              child: Text('Refresco',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                  )),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Refresco()));
                              })),
                      SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        height: 120,
                      ),
                      Image.asset(
                        'assets/telaMenu.png',
                        height: 200,
                        width: 300,
                      ),
                    ],
                  )
                ],
              ),
            )));
  }
}

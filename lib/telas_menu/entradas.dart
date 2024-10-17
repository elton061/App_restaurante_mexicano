import 'package:flutter/material.dart';
import 'package:projeto_p1/pratos_entradas/chips.dart';
import 'package:projeto_p1/pratos_entradas/guacamole.dart';
import 'package:projeto_p1/pratos_entradas/nachos.dart';
import 'package:projeto_p1/pratos_entradas/sopes.dart';

class Entradas extends StatelessWidget {
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
                      'Entradas',
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
                              child: Text('Guacamole',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                  )),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Guacamole()));
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
                              child: Text('Nachos clássicos',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                  )),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Nachos()));
                              })),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                          //Quesadilla
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
                              child: Text('Sopes',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                  )),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Sopes()));
                              })),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                          // Chiles en Nogada
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
                              child: Text('Chips com salsa',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                  )),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Chips()));
                              })),
                      SizedBox(
                        height: 60,
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

import 'package:flutter/material.dart';
import 'package:projeto_p1/pratos_principais/burrito.dart';
import 'package:projeto_p1/pratos_principais/chiles.dart';
import 'package:projeto_p1/pratos_principais/quesadilla.dart';
import 'package:projeto_p1/pratos_principais/tacos_pastor.dart';

class Pprincipais extends StatelessWidget {
  const Pprincipais({super.key});

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
                      'Pratos Principais',
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
                      SizedBox(
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
                              child: Text('Tacos Al Pastor',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                  )),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => TacosPastor()));
                              })),
                      SizedBox(
                        height: 30,
                      ),
                      SizedBox(
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
                              child: Text('Burrito de frango',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                  )),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Burrito()));
                              })),
                      SizedBox(
                        height: 30,
                      ),
                      SizedBox(
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
                              child: Text('Quesadilla',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                  )),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Quesadilla()));
                              })),
                      SizedBox(
                        height: 30,
                      ),
                      SizedBox(
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
                              child: Text('Chiles en Nogada',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                  )),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Chiles()));
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

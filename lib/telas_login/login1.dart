import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'resetar_senha.dart';
import 'cadastro.dart';
import '../telas_menu/tela_menu.dart';

class Login1 extends StatefulWidget {
  createState() {
    return Login1State();
  }
}

class Login1State extends State<Login1> {
  final TextEditingController controladorUsuario = TextEditingController();
  final TextEditingController controladorSenha = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void validarLogin() async {
    String usuario = controladorUsuario.text.trim();
    String senha = controladorSenha.text.trim();

    if (usuario.isEmpty || senha.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Por favor, preencha usuário e senha!'),
        backgroundColor: Colors.orange,
      ));
    } else {
      try {
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: usuario,
          password: senha,
        );

        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => TelaMenu()),
        );
      } on FirebaseAuthException catch (e) {
        String errorMessage = 'Erro desconhecido';

        if (e.code == 'user-not-found') {
          errorMessage = 'Nenhum usuário encontrado com esse e-mail.';
        } else if (e.code == 'wrong-password') {
          errorMessage = 'Senha incorreta. Tente novamente.';
        } else if (e.code == 'invalid-email') {
          errorMessage = 'O formato do e-mail é inválido.';
        } else if (e.code == 'network-request-failed') {
          errorMessage = 'Falha na conexão com a rede. Tente novamente.';
        }

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(errorMessage),
          backgroundColor: Colors.red,
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 248, 176, 22),
      ),
      body: Center(
        child: Container(
          height: 750,
          width: 400,
          color: const Color.fromARGB(255, 253, 246, 237),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset('assets/login.png'),
                  SizedBox(height: 100),
                  Text('LOGIN',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                      )),
                  SizedBox(height: 30),
                  TextField(
                    controller: controladorUsuario,
                    decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                        hintText: 'Digite seu e-mail'),
                  ),
                  SizedBox(height: 50),
                  TextField(
                    controller: controladorSenha,
                    decoration: InputDecoration(
                        labelText: 'Senha',
                        border: OutlineInputBorder(),
                        hintText: 'Digite sua senha'),
                    obscureText: true,
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ResetarSenha(),
                          ));
                        },
                        child: Text('Esqueci a senha',
                            style: TextStyle(
                              fontSize: 14,
                              color: const Color.fromARGB(255, 236, 69, 3),
                            )),
                      ),
                      SizedBox(width: 120),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Cadastro(),
                          ));
                        },
                        child: Text('Criar conta',
                            style: TextStyle(
                              fontSize: 14,
                              color: const Color.fromARGB(255, 236, 69, 3),
                            )),
                      ),
                    ],
                  ),
                  SizedBox(height: 50),
                  ElevatedButton(
                    child: Text('ENTRAR',
                        style: TextStyle(
                          color: Colors.white,
                        )),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.red,
                      disabledForegroundColor: Colors.yellow.withOpacity(0.38),
                      disabledBackgroundColor: Colors.yellow.withOpacity(0.12),
                    ),
                    onPressed: () {
                      validarLogin();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

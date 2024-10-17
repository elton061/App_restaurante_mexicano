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
  Widget build(BuildContext context) {
    final TextEditingController controladorUsuario = TextEditingController();
    final TextEditingController controladorSenha = TextEditingController();

    void validarLogin() {
      String usuario = controladorUsuario.text.trim();
      String senha = controladorSenha.text.trim();

      if (usuario.isEmpty || senha.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Por favor, preencha usuario e senha!'),
          backgroundColor: Colors.orange,
        ));
      } else {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => TelaMenu(),
        ));
      }
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 248, 176, 22),
        ),
        body: Center(
          child: Container(
            height: 750, // define a altura do container
            width: 400, // define a largura do container
            color: const Color.fromARGB(255, 253, 246, 237),
            child: Center(
                child: Padding(
              padding: const EdgeInsets.all(
                  20.0), //Cria um espacamento entre as bordas e o limite da tela
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Image.asset('assets/login.png'),
                  SizedBox(height: 100),
                  Text('LOGIN',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                      )),
                  SizedBox(
                      //cria um espaco de acordo com o tamanho inserido. Util para personalizar o alinhamento dos widgets
                      height: 30),
                  TextField(
                    controller: controladorUsuario,
                    decoration: InputDecoration(
                        labelText: 'Usuário',
                        border: OutlineInputBorder(),
                        hintText: 'Digite seu nome de usuário'),
                  ),
                  SizedBox(height: 50),
                  TextField(
                    controller: controladorSenha,
                    decoration: InputDecoration(
                        labelText: 'Senha',
                        border: OutlineInputBorder(),
                        hintText: 'Digite sua senha'),
                    obscureText: true, // Para ocultar a senha
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextButton(
                        //Cria o botao resetar senha. O onpressed direciona para a pagina ao clickar no botao
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
                      SizedBox(
                          width:
                              120), // separa os botoes esqueci e senha e criar conta
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
            )),
          ),
        ));
  }
}

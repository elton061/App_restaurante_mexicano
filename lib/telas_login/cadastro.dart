import 'package:flutter/material.dart';
import 'login1.dart';

class Cadastro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController controllCadastroEmail = TextEditingController();
    final TextEditingController controllCadastroUsuario =
        TextEditingController();
    final TextEditingController controllCadastroSenha = TextEditingController();

    void validarCadastro() {
      String usuario = controllCadastroUsuario.text.trim();
      String senha = controllCadastroSenha.text.trim();
      String email = controllCadastroEmail.text.trim();

      if (usuario.isEmpty || senha.isEmpty || email.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Preencha todos os campos para realizar o cadastro!'),
            backgroundColor: Colors.orange));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Cadastro realizado com sucesso!'),
            backgroundColor: Colors.orange));

        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Login1()));
      }
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 248, 176, 22),
        ),
        body: Container(
            color: const Color.fromARGB(255, 253, 246, 237),
            child: Padding(
                padding: const EdgeInsets.all(
                    20.0), //Cria um espacamento entre as bordas e o limite da tela
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text('CADASTRO',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          )),
                      Image.asset(
                        'assets/login.png',
                        height: 250,
                        width: 250,
                      ),
                      TextField(
                        controller: controllCadastroEmail,
                        decoration: InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(),
                            hintText: 'Digite o seu email'),
                      ),
                      SizedBox(
                          height: 15), // estabelece um espaco entre os campos
                      TextField(
                          controller: controllCadastroUsuario,
                          decoration: InputDecoration(
                            labelText: 'Usuario',
                            border: OutlineInputBorder(),
                            hintText: 'Digite seu nome de usuario',
                          )),
                      SizedBox(
                          height: 15), // estabelece um espaco entre os campos
                      TextField(
                          controller: controllCadastroSenha,
                          decoration: InputDecoration(
                            labelText: 'Senha',
                            border: OutlineInputBorder(),
                            hintText: 'Digite a sua senha',
                          )),
                      SizedBox(height: 60),
                      ElevatedButton(
                        child: Text('CONFIRMAR',
                            style: TextStyle(
                              color: Colors.white,
                            )),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.red,
                          disabledForegroundColor:
                              Colors.yellow.withOpacity(0.38),
                          disabledBackgroundColor:
                              Colors.yellow.withOpacity(0.12),
                        ),
                        onPressed: () {
                          validarCadastro();
                        },
                      ),
                    ]))));
  }
}

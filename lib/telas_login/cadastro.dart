import 'package:flutter/material.dart';
import 'package:projeto_p1/controladores/login_controller.dart';
import 'login1.dart';

class Cadastro extends StatelessWidget {
  const Cadastro({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controllCadastroEmail = TextEditingController();
    final TextEditingController controllCadastroUsuario =
        TextEditingController();
    final TextEditingController controllCadastroSenha = TextEditingController();

    final LoginController loginController = LoginController();

    void validarCadastro() {
      String usuario = controllCadastroUsuario.text.trim();
      String senha = controllCadastroSenha.text.trim();
      String email = controllCadastroEmail.text.trim();

      if (usuario.isEmpty || senha.isEmpty || email.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Preencha todos os campos para realizar o cadastro!'),
            backgroundColor: Colors.orange));
      } else {
        loginController.criarConta(context, usuario, email, senha);
      }
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 248, 176, 22),
        ),
        body: Container(
            color: const Color.fromARGB(255, 253, 246, 237),
            child: Padding(
                padding: const EdgeInsets.all(20.0), 
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                      SizedBox(height: 15),
                      TextField(
                          controller: controllCadastroUsuario,
                          decoration: InputDecoration(
                            labelText: 'Usuario',
                            border: OutlineInputBorder(),
                            hintText: 'Digite seu nome de usuario',
                          )),
                      SizedBox(height: 15),
                      TextField(
                          controller: controllCadastroSenha,
                          obscureText: true, // Senha oculta
                          decoration: InputDecoration(
                            labelText: 'Senha',
                            border: OutlineInputBorder(),
                            hintText: 'Digite a sua senha',
                          )),
                      SizedBox(height: 60),
                      ElevatedButton(
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
                        child: Text('CONFIRMAR',
                            style: TextStyle(
                              color: Colors.white,
                            )),
                      ),
                    ]))));
  }
}

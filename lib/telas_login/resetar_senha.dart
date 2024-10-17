import 'package:flutter/material.dart';
import 'login1.dart';

class ResetarSenha extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController controllNovaSenha = TextEditingController();
    final TextEditingController controllConfirmacaoSenha =
        TextEditingController();

    void validarSenha() {
      String novaSenha = controllNovaSenha.text.trim();
      String confirmacaoSenha = controllConfirmacaoSenha.text.trim();

      if (novaSenha.isEmpty || confirmacaoSenha.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
                'Preencha todos os campos para realizar a troca de senha!'),
            backgroundColor: Colors.orange));
      } else if (novaSenha != confirmacaoSenha) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              'Confirmação de senha inválida! Certifique-se de que ambas as senhas são iguais.'),
          backgroundColor: Colors.orange,
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Senha alterada com sucesso!'),
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
                      Text('Resetar Senha',
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
                        controller: controllNovaSenha,
                        decoration: InputDecoration(
                            labelText: 'Nova senha',
                            border: OutlineInputBorder(),
                            hintText: 'Digite a nova senha'),
                      ),
                      SizedBox(
                          height: 15), // estabelece um espaco entre os campos
                      TextField(
                          controller: controllConfirmacaoSenha,
                          decoration: InputDecoration(
                            labelText: 'Confirmar senha',
                            border: OutlineInputBorder(),
                            hintText: 'Digite novamente a sua senha',
                          )),
                      SizedBox(
                          height: 15), // estabelece um espaco entre os campos
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
                          validarSenha();
                        },
                      ),
                    ]))));
  }
}

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login1.dart';

class ResetarSenha extends StatelessWidget {
  final TextEditingController controllEmail = TextEditingController();
  final TextEditingController controllNovaSenha = TextEditingController();
  final TextEditingController controllConfirmacaoSenha = TextEditingController();

  void validarSenha(BuildContext context) async {
    String email = controllEmail.text.trim();
    String novaSenha = controllNovaSenha.text.trim();
    String confirmacaoSenha = controllConfirmacaoSenha.text.trim();

    if (email.isEmpty || novaSenha.isEmpty || confirmacaoSenha.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Preencha todos os campos para realizar a troca de senha!'),
          backgroundColor: Colors.orange));
    } else if (novaSenha != confirmacaoSenha) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Confirmação de senha inválida! Certifique-se de que ambas as senhas são iguais.'),
        backgroundColor: Colors.orange,
      ));
    } else {
      try {
        User? user = FirebaseAuth.instance.currentUser;

        if (user != null && user.email == email) {
          await user.updatePassword(novaSenha);
          await user.reload();

          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Senha alterada com sucesso!'),
              backgroundColor: Colors.green));

          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => Login1()));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('E-mail não corresponde ao usuário autenticado!'),
            backgroundColor: Colors.red,
          ));
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Erro ao alterar a senha: ${e.toString()}'),
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
      body: Container(
        color: const Color.fromARGB(255, 253, 246, 237),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Resetar Senha',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              Image.asset(
                'assets/login.png',
                height: 250,
                width: 250,
              ),
              TextField(
                controller: controllEmail,
                decoration: InputDecoration(
                  labelText: 'E-mail',
                  border: OutlineInputBorder(),
                  hintText: 'Digite seu e-mail',
                ),
              ),
              SizedBox(height: 15),
              TextField(
                controller: controllNovaSenha,
                decoration: InputDecoration(
                  labelText: 'Nova senha',
                  border: OutlineInputBorder(),
                  hintText: 'Digite a nova senha',
                ),
                obscureText: true,
              ),
              SizedBox(height: 15),
              TextField(
                controller: controllConfirmacaoSenha,
                decoration: InputDecoration(
                  labelText: 'Confirmar senha',
                  border: OutlineInputBorder(),
                  hintText: 'Digite novamente a sua senha',
                ),
                obscureText: true,
              ),
              SizedBox(height: 15),
              SizedBox(height: 60),
              ElevatedButton(
                child: Text(
                  'CONFIRMAR',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.red,
                ),
                onPressed: () {
                  validarSenha(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

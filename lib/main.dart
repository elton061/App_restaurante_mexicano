import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:get_it/get_it.dart';
import 'package:projeto_p1/telas_login/login1.dart';
import 'classe/carrinho.dart';

void main() {
  GetIt.I.registerSingleton<Carrinho>(Carrinho());

  runApp(
    DevicePreview(
      enabled: true, // Ativa ou desativa o Device Preview
      builder: (context) => MaterialApp(
        useInheritedMediaQuery: true,
        builder:
            DevicePreview.appBuilder, // Adiciona o builder do Device Preview
        home: Login1(), // Define a tela inicial
      ),
    ),
  );
}

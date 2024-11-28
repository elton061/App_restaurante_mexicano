import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:get_it/get_it.dart';
import 'package:projeto_p1/firebase_options.dart';
import 'package:projeto_p1/telas_login/login1.dart';
import 'classe/carrinho.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Inicializa o Flutter
  GetIt.I.registerSingleton<Carrinho>(Carrinho());

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MaterialApp(
        useInheritedMediaQuery: true,
        builder: DevicePreview.appBuilder,
        home: Login1(),
      ),
    ),
  );

}

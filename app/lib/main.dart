import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projeto_dispositivos_moveis/repositories/address_repository.dart';
import 'package:projeto_dispositivos_moveis/repositories/card_repository.dart';
import 'package:projeto_dispositivos_moveis/repositories/myAddress_repository.dart';
import 'package:projeto_dispositivos_moveis/services/auth_service.dart';
import 'package:projeto_dispositivos_moveis/widget/auth_check.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => AuthService()),
      ChangeNotifierProvider(
          create: (context) => CardRepository(
                auth: context.read<AuthService>(),
              )),
      ChangeNotifierProvider(
          create: (context) => AddressRepository(
                auth: context.read<AuthService>(),
              )),
      ChangeNotifierProvider(
          create: (context) => MyAddressRepository(
                auth: context.read<AuthService>(),
              )),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthCheck(),
    );
  }
}

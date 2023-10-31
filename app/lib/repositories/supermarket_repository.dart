import 'package:flutter/material.dart';
import 'package:projeto_dispositivos_moveis/model/supermarket_model.dart';

class SupermercadoRepository extends ChangeNotifier {
  final List<Supermercado> _supermercados = [
    Supermercado(
      nome: 'Supermercado Condor Jardim Carvalho',
      endereco:
          'Av. Monteiro Lobato, 2180 - Jardim Carvalho, Ponta Grossa - PR',
      latitude: -25.072190,
      longitude: -50.150282,
    ),
    Supermercado(
      nome: 'Supermercados Tozetto - Jardim Carvalho',
      endereco:
          'Av. Monteiro Lobato, 1951 - Jardim Carvalho, Ponta Grossa - PR',
      latitude: -25.0737346,
      longitude: -50.1535916,
    ),
    Supermercado(
      nome: 'Max Atacadista Jardim Carvalho',
      endereco:
          'Av. Monteiro Lobato, 2493 - Jardim Carvalho, Ponta Grossa - PR',
      latitude: -25.069821,
      longitude: -50.147460,
    ),
  ];

  List<Supermercado> get supermercados => _supermercados;
}

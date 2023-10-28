import 'package:projeto_dispositivos_moveis/model/address_model.dart';

class AddressRepository {
  static List<AddressModel> lista = [
    AddressModel(
        zipcode: 84015700,
        address: 'R. Dep. Chafic Cury',
        number: '310',
        complement: 'Jardim Carvalho',
        city: 'Ponta Grossa',
        uf: 'PR'),
    AddressModel(
        zipcode: 84010630,
        address: 'R. Santos Dumont',
        number: '943',
        complement: 'Centro',
        city: 'Ponta Grossa',
        uf: 'PR'),
    AddressModel(
        zipcode: 84015370,
        address: 'R. Antônio João',
        number: '447',
        complement: 'Jardim Carvalho',
        city: 'Ponta Grossa',
        uf: 'PR'),
  ];
}

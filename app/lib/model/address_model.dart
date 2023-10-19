class AddressModel {
  int zipcode;
  String address;
  String number;
  String city;
  String uf;
  String complement;

  AddressModel(
      {required this.zipcode,
      required this.address,
      required this.number,
      required this.city,
      required this.uf,
      required this.complement});
}

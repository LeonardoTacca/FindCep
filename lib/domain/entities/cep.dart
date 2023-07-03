class Cep {
  final String cep;
  final String? street;
  final String? complement;
  final String? neighborhood;
  final String city;
  final String uf;
  final int ibge;
  final int ddd;

  Cep({required this.cep, this.street, this.complement, this.neighborhood, required this.city, required this.uf, required this.ibge, required this.ddd});
}

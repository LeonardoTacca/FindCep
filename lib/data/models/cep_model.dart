// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:find_cep_app/domain/entities/cep.dart';

class CepModel extends Cep {
  CepModel({
    required super.cep,
    super.street,
    super.complement,
    super.neighborhood,
    required super.city,
    required super.uf,
    required super.ibge,
    required super.ddd,
  });

  CepModel copyWith({
    String? cep,
    String? street,
    String? complement,
    String? neighborhood,
    String? city,
    String? uf,
    int? ibge,
    int? ddd,
  }) {
    return CepModel(
      cep: cep ?? this.cep,
      street: street ?? this.street,
      complement: complement ?? this.complement,
      neighborhood: neighborhood ?? this.neighborhood,
      city: city ?? this.city,
      uf: uf ?? this.uf,
      ibge: ibge ?? this.ibge,
      ddd: ddd ?? this.ddd,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cep': cep,
      'street': street,
      'complement': complement,
      'neighborhood': neighborhood,
      'city': city,
      'uf': uf,
      'ibge': ibge,
      'ddd': ddd,
    };
  }

  factory CepModel.fromMapApi(Map<String, dynamic> map) {
    return CepModel(
      cep: map['cep'] as String,
      street: map['logradouro'] != null ? map['logradouro'] as String : null,
      complement: map['complemento'] != null ? map['complemento'] as String : null,
      neighborhood: map['bairro'] != null ? map['bairro'] as String : null,
      city: map['localidade'],
      uf: map['uf'] as String,
      ibge: int.parse(map['ibge']),
      ddd: int.parse(map['ddd']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CepModel.fromJson(String source) => CepModel.fromMapApi(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CepModel(cep: $cep, street: $street, complement: $complement, neighborhood: $neighborhood, city: $city, uf: $uf, ibge: $ibge, ddd: $ddd)';
  }

  @override
  bool operator ==(covariant CepModel other) {
    if (identical(this, other)) return true;

    return other.cep == cep &&
        other.street == street &&
        other.complement == complement &&
        other.neighborhood == neighborhood &&
        other.city == city &&
        other.uf == uf &&
        other.ibge == ibge &&
        other.ddd == ddd;
  }

  @override
  int get hashCode {
    return cep.hashCode ^ street.hashCode ^ complement.hashCode ^ neighborhood.hashCode ^ city.hashCode ^ uf.hashCode ^ ibge.hashCode ^ ddd.hashCode;
  }
}

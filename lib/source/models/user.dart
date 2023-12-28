// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:users_app/source/models/address.dart';
import 'package:users_app/source/models/company.dart';

/// Optei por criar a serialização da classe utilizando uma extensão
/// geradora de `DataClass` e para o equality a utilização do Equatable,
/// portanto com essa combinação não é necessário utilizar geradores de código.
/// Para gerar criar os modelos utilizando geração de código poderia ser utilizado
/// as libs `Freezed` ou `JsonSerializable`.
class User extends Equatable {
  final int id;
  final String name;
  final String username;
  final String email;
  final String phone;
  final String website;
  final Company company;
  final Address address;

  const User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.website,
    required this.company,
    required this.address,
  });

  User copyWith({
    int? id,
    String? name,
    String? username,
    String? email,
    String? phone,
    String? website,
    Company? company,
    Address? address,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      website: website ?? this.website,
      company: company ?? this.company,
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'username': username,
      'email': email,
      'phone': phone,
      'website': website,
      'company': company.toMap(),
      'address': address.toMap(),
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      name: map['name'] as String,
      username: map['username'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
      website: map['website'] as String,
      company: Company.fromMap(map['company'] as Map<String, dynamic>),
      address: Address.fromMap(map['address'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      name,
      username,
      email,
      phone,
      website,
      company,
      address,
    ];
  }
}

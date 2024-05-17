import 'package:flutter_architectures/clean-architecture/domain/entities/pokemon_entity.dart';

class PokemonModel extends PokemonEntity {
  const PokemonModel({required super.name, required super.url});

  factory PokemonModel.fromJson(Map<String, dynamic> map) {
    return PokemonModel(name: map['name'] ?? "", url: map['url'] ?? "");
  }
}

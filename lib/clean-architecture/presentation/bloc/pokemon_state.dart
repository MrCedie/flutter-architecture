import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_architectures/clean-architecture/domain/entities/pokemon_entity.dart';

abstract class PokemonState extends Equatable {
  final List<PokemonEntity>? pokemons;
  final DioException? error;

  const PokemonState({this.pokemons, this.error});

  @override
  List<Object?> get props => [pokemons, error];
}

class PokemonLoading extends PokemonState {
  const PokemonLoading();
}

class PokemonDone extends PokemonState {
  const PokemonDone(List<PokemonEntity> pokemons) : super(pokemons: pokemons);
}

class PokemonError extends PokemonState {
  const PokemonError(DioException error) : super(error: error);
}

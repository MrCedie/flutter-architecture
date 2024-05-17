import 'package:flutter_architectures/clean-architecture/core/resource/data_state.dart';
import 'package:flutter_architectures/clean-architecture/domain/entities/pokemon_entity.dart';

abstract class PokemonRepository {
  Future<DataState<List<PokemonEntity>>> getPokemonList();
}

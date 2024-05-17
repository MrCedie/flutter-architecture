import 'package:flutter_architectures/clean-architecture/core/resource/data_state.dart';
import 'package:flutter_architectures/clean-architecture/domain/entities/pokemon_entity.dart';
import 'package:flutter_architectures/clean-architecture/domain/repositories/pokemon_repository.dart';
import 'package:flutter_architectures/clean-architecture/core/usecase/usecase.dart';

class GetPokemonListUseCase
    implements UseCase<DataState<List<PokemonEntity>>, void> {
  final PokemonRepository _repository;

  GetPokemonListUseCase(this._repository);
  @override
  Future<DataState<List<PokemonEntity>>> call({void params}) {
    return _repository.getPokemonList();
  }
}

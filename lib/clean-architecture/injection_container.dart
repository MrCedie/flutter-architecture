import 'package:flutter_architectures/clean-architecture/data/repository/pokemon_repository_impl.dart';
import 'package:flutter_architectures/clean-architecture/domain/repositories/pokemon_repository.dart';
import 'package:flutter_architectures/clean-architecture/domain/usecases/get_pokemon_list_usecase.dart';
import 'package:flutter_architectures/clean-architecture/presentation/bloc/pokemon_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dependencies
  sl.registerSingleton<PokemonRepository>(
    PokemonRepositoryImpl(),
  );

  // Use Cases
  sl.registerSingleton<GetPokemonListUseCase>(GetPokemonListUseCase(sl()));

  // Blocs
  sl.registerFactory<PokemonBloc>(
    () => PokemonBloc(sl()),
  );
}

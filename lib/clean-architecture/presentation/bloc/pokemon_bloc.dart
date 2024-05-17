import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_architectures/clean-architecture/core/resource/data_state.dart';
import 'package:flutter_architectures/clean-architecture/domain/usecases/get_pokemon_list_usecase.dart';
import 'package:flutter_architectures/clean-architecture/presentation/bloc/pokemon_event.dart';
import 'package:flutter_architectures/clean-architecture/presentation/bloc/pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final GetPokemonListUseCase _getPokemonListUseCase;

  PokemonBloc(this._getPokemonListUseCase) : super(const PokemonLoading()) {
    on<GetPokemonList>(_getPokemonList);
  }

  Future _getPokemonList(
    GetPokemonList event,
    Emitter<PokemonState> emit,
  ) async {
    emit(const PokemonLoading());
    final dataState = await _getPokemonListUseCase();

    if (dataState is DataSuccess) {
      emit(PokemonDone(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(PokemonError(dataState.error!));
    }
  }
}

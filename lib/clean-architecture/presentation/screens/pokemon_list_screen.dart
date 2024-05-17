import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architectures/clean-architecture/injection_container.dart';
import 'package:flutter_architectures/clean-architecture/presentation/bloc/pokemon_bloc.dart';
import 'package:flutter_architectures/clean-architecture/presentation/bloc/pokemon_event.dart';
import 'package:flutter_architectures/clean-architecture/presentation/bloc/pokemon_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PokemonListScreen extends StatefulWidget {
  const PokemonListScreen({super.key});

  @override
  State<PokemonListScreen> createState() => _PokemonListScreenState();
}

class _PokemonListScreenState extends State<PokemonListScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<PokemonBloc>()..add(const GetPokemonList()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Pokemon List')),
        body: BlocBuilder<PokemonBloc, PokemonState>(
          builder: (context, state) {
            if (state is PokemonLoading) {
              return const Center(child: CupertinoActivityIndicator());
            } else if (state is PokemonDone) {
              final list = state.pokemons ?? [];
              return ListView.builder(
                itemCount: list.length,
                itemBuilder: (ctx, i) => ListTile(
                  title: Text(list[i].name),
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}

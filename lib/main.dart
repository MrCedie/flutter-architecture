import 'package:flutter/material.dart';
import 'package:flutter_architectures/clean-architecture/injection_container.dart';
import 'package:flutter_architectures/clean-architecture/presentation/screens/pokemon_list_screen.dart';

void main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Architecture',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const PokemonListScreen(),
    );
  }
}

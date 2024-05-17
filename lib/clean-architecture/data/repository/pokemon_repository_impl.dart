import 'package:dio/dio.dart';
import 'package:flutter_architectures/clean-architecture/core/resource/data_state.dart';
import 'package:flutter_architectures/clean-architecture/data/models/pokemon_model.dart';
import 'package:flutter_architectures/clean-architecture/domain/repositories/pokemon_repository.dart';

final dio = Dio();

class PokemonRepositoryImpl extends PokemonRepository {
  @override
  Future<DataState<List<PokemonModel>>> getPokemonList() async {
    try {
      final response = await dio.get(
        'https://pokeapi.co/api/v2/pokemon?offset=0&limit=20',
      );

      if (response.statusCode == 200) {
        final data = response.data['results'];
        return DataSuccess<List<PokemonModel>>(
          List.generate(
            data.length,
            (index) => PokemonModel.fromJson(data[index]),
          ),
        );
      } else {
        return DataFailed(
          DioException(
            error: response.statusMessage,
            response: response,
            type: DioExceptionType.values.first,
            requestOptions: response.requestOptions,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}

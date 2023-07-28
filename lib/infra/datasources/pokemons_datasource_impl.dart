import 'package:dio/dio.dart';
import 'package:miscellaneous/infra/mappers/pokemon_mapper.dart';

import '../../domain/domain.dart';

class PokemonDatasourceImpl implements PokemonsDatasource {
  final Dio dio;

  PokemonDatasourceImpl()
      : dio = Dio(BaseOptions(baseUrl: 'https://pokeapi.co/api/v2/'));

  @override
  Future<(PokemonEntity?, String)> getPokemon(String id) async {
    try {
      final response = await dio.get('/pokemon/$id');

      return (
        PokemonMapper.pokemonApiPokemonToEntity(response.data),
        'Pokemon obtido com sucesso'
      );
    } catch (e) {
      return (null, 'Impossivel obter o pokemon $e');
    }
  }
}

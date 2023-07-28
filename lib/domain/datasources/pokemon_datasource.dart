import 'package:miscellaneous/domain/entities/pokemon_entity.dart';

abstract class PokemonsDatasource {
  Future<(PokemonEntity?, String)> getPokemon(String id);
}

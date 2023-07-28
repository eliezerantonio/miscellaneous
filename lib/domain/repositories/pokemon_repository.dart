import '../domain.dart';

abstract class PokemonsRepository {
  Future<(PokemonEntity?, String)> getPokemon(String id);
}

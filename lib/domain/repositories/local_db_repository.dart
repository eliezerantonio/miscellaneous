import 'package:miscellaneous/domain/domain.dart';

abstract class LocalDbRepository {
  Future<List<PokemonEntity>> loadPokemons();
  Future<int> pokemonCount();
  Future<void> insertPokemon(PokemonEntity pokemon);


}

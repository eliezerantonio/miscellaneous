import 'package:miscellaneous/domain/domain.dart';

import '../models/pokeapi_pokemon_response.dart';

class PokemonMapper {
  static PokemonEntity pokemonApiPokemonToEntity(Map<String, dynamic> json) {
    final pokeApiPokemonResponse = PokeApiPokemonResponse.fromJson(json);
    return PokemonEntity(
        id: pokeApiPokemonResponse.id,
        name: pokeApiPokemonResponse.name,
        sprintFront: pokeApiPokemonResponse.sprites.frontDefault);
  }
}

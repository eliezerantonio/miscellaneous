import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscellaneous/infra/repositories/pokemons_repository.dart';

import '../../../domain/domain.dart';

final pokemonRepositoryProvider = Provider((ref) {
  return PokemonsRepositoryImpl();
});
final pokemonProvider =  FutureProvider.family<PokemonEntity, String>((ref, id) async {
  final pokemonRepository = ref.watch(pokemonRepositoryProvider);
  final (pokemon, error) = await pokemonRepository.getPokemon(id);

  if (pokemon != null) return pokemon;

  throw error;
});

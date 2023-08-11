import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscellaneous/domain/domain.dart';
import 'package:miscellaneous/infra/infrastructure.dart';

final pokemonDbProvider =   FutureProvider.autoDispose<List<PokemonEntity>>((ref) async {
  final localDb = LocalDbRepositoryImpl();

  final pokemons = await localDb.loadPokemons();

  return pokemons;
});

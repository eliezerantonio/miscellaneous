import 'package:miscellaneous/infra/datasources/isar_local_db_datasource.dart';

import '../../domain/domain.dart';

class LocalDbRepositoryImpl extends LocalDbRepository {
  final LocalDbDatasource _datasource;

  LocalDbRepositoryImpl([LocalDbDatasource? datasource])
      : _datasource = datasource ?? IsarLocalDbDatasource();

  @override
  Future<void> insertPokemon(PokemonEntity pokemon) async {
    _datasource.insertPokemon(pokemon);
  }

  @override
  Future<List<PokemonEntity>> loadPokemons() async {
    return await _datasource.loadPokemons();
  }

  @override
  Future<int> pokemonCount() async {
    return await _datasource.pokemonCount();
  }
}

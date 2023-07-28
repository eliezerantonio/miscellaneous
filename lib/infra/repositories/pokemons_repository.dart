import '../../domain/domain.dart';
import '../datasources/pokemons_datasource_impl.dart';

class PokemonsRepositoryImpl implements PokemonsRepository {
  final PokemonsDatasource datasource;

  PokemonsRepositoryImpl({PokemonsDatasource? datasource}): datasource = datasource ?? PokemonDatasourceImpl();

  @override
  Future<(PokemonEntity?, String)> getPokemon(String id) async {
    return datasource.getPokemon(id);
  }
}

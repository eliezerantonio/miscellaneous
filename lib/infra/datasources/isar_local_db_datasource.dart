import 'dart:developer';

import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../../domain/domain.dart';

class IsarLocalDbDatasource extends LocalDbDatasource {
  late Future<Isar> db;

  IsarLocalDbDatasource() {
    db = openDb();
  }

  Future<Isar> openDb() async {
    final dir = await getApplicationDocumentsDirectory();
    if (Isar.instanceNames.isEmpty) {
      return Isar.open([PokemonEntitySchema], directory: dir.path);
    }

    return Future.value(Isar.getInstance());
  }

  @override
  Future<void> insertPokemon(PokemonEntity pokemon) async {
    final isar = await db;

    final done = isar.writeTxnSync(() => isar.pokemonEntitys.putSync(pokemon));

    log(done.toString());
  }

  @override
  Future<List<PokemonEntity>> loadPokemons() async {
    final isar = await db;

    return isar.pokemonEntitys.where().findAll();
  }

  @override
  Future<int> pokemonCount() async {
    final isar = await db;

    return isar.pokemonEntitys.count();
  }
}

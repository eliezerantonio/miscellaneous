import 'dart:developer';

import 'package:miscellaneous/infra/infrastructure.dart';
import 'package:workmanager/workmanager.dart';

const fetchBackgroundTaskKey =
    "com.eliezerantonio.miscellaneous.fetch-background-pokemon";
const fetchPerioficBackgroundTaskKey =
    "com.eliezerantonio.miscellaneous.fetch-background-periodic-pokemon";

@pragma('vm:entry-point')
Future<void> callbackDispatcher() async {
  Workmanager().executeTask((taskName, inputData) async {
    // log('Native: called background task: $taskName');

    switch (taskName) {
      case fetchBackgroundTaskKey:
      await  loadNextPokemon();
        break;
      case fetchPerioficBackgroundTaskKey:
        log('fetchPerioficBackgroundTaskKey');
        break;

      case Workmanager.iOSBackgroundTask:
        log('iOSBackgroundTask');
        break;
    }
    return Future.value(true);
  });
}

Future loadNextPokemon() async {
  final localDbRepository = LocalDbRepositoryImpl();
  final pokemonRepository = PokemonDatasourceImpl();

  final lasPokemonId = await localDbRepository.pokemonCount() + 1;
  
  try {

    final (pokemon, message) =   await pokemonRepository.getPokemon('$lasPokemonId');

    if (pokemon == null) throw message;

    await localDbRepository.insertPokemon(pokemon);

    log("Pokemon inserted: ${pokemon.name}");
  } catch (e) {
    log(e.toString());
  }
}

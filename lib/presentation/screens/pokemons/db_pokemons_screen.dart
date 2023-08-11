import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscellaneous/config/configs.dart';
import 'package:miscellaneous/domain/domain.dart';
import 'package:miscellaneous/presentation/providers/background_tasks/background_tasks_provider.dart';
import 'package:miscellaneous/presentation/providers/providers.dart';
import 'package:workmanager/workmanager.dart';

class DbPokemonScreen extends ConsumerWidget {
  const DbPokemonScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final pokemonsAsync = ref.watch(pokemonDbProvider);
    final isBrackgroundFetchActive = ref.watch(backgrounFetchProvider);
    if (pokemonsAsync.isLoading) {
      return const Material(child: Center(child: CircularProgressIndicator()));
    }

    final List<PokemonEntity> pokemons = pokemonsAsync.value ?? [];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Backgroud processes'),
        actions: [
          IconButton(
            onPressed: () {
              Workmanager().registerOneOffTask(
                  fetchBackgroundTaskKey, fetchBackgroundTaskKey,
                  initialDelay: const Duration(seconds: 3),
                  inputData: {"Helllo": "Mundo"});
            },
            icon: const Icon(Icons.add_alarm_sharp),
          )
        ],
      ),
      body: CustomScrollView(
        slivers: [_PokemonsGrid(pokedmons: pokemons)],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ref.read(backgrounFetchProvider.notifier).toggleTask();
        },
        icon: const Icon(Icons.av_timer),
        label:  Text((isBrackgroundFetchActive==false)?'Activar fetch periodic':'Desacticar fetch pericodic'),
      ),
    );
  }
}

class _PokemonsGrid extends StatelessWidget {
  final List<PokemonEntity> pokedmons;

  const _PokemonsGrid({required this.pokedmons});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, crossAxisSpacing: 2, mainAxisSpacing: 2),
      itemCount: pokedmons.length,
      itemBuilder: ((context, index) {
        final pokemon = pokedmons[index];
        return Column(
          children: [
            Image.network(pokemon.sprintFront, fit: BoxFit.cover),
            Text(pokemon.name)
          ],
        );
      }),
    );
  }
}

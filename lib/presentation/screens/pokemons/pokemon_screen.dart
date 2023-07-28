import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscellaneous/config/configs.dart';
import 'package:miscellaneous/domain/domain.dart';

import '../../providers/providers.dart';

class PokemonScreen extends ConsumerWidget {
  const PokemonScreen({super.key, required this.pokemonId});

  final String pokemonId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonAsync = ref.watch(pokemonProvider(pokemonId));

    return pokemonAsync.when(
      data: (data) => PokemonView(pokemon: data),
      error: (error, erroStackTrace) => Text("$error"),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class PokemonView extends StatelessWidget {
  const PokemonView({super.key, required this.pokemon});

  final PokemonEntity pokemon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.name),
        actions: [
          IconButton(
              onPressed: () {
                //link =deepLink
                SharePlugin.shareLink(pokemon.sprintFront, 'enviar pokemon');
              },
              icon: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Icon(Icons.share),
              ))
        ],
      ),
      body: Center(
        child: Image.network(
          pokemon.sprintFront,
          fit: BoxFit.cover,
          width: 150,
          height: 150,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:miscellaneous/presentation/providers/providers.dart';

class PokemonsScreen extends StatelessWidget {
  const PokemonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _PokemonsView(),
    );
  }
}

class _PokemonsView extends ConsumerStatefulWidget {
  const _PokemonsView();

  @override
  PokemonsViewState createState() => PokemonsViewState();
}

class PokemonsViewState extends ConsumerState<_PokemonsView> {
  final scrollControoler = ScrollController();

  void infinityScroll() {
    final currentPokemons = ref.read(pokemonIdsProvider);

    if (currentPokemons.length > 400) {
      scrollControoler.removeListener(infinityScroll);

      return;
    }

    if ((scrollControoler.position.pixels + 200) >
        scrollControoler.position.maxScrollExtent) {
      ref.read(pokemonIdsProvider.notifier).update((state) => [
            ...state,
            ...List.generate(30, (index) => state.length + index + 1)
          ]);
    }
  }

  @override
  void initState() {
    super.initState();
    scrollControoler.addListener(infinityScroll);
  }

  @override
  void dispose() {
    scrollControoler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollControoler,
      slivers: [
        SliverAppBar(
          title: const Text('Pokemons'),
          floating: true,
          backgroundColor: Colors.white.withOpacity(0.8),
        ),
        const _PokemonsGrid()
      ],
    );
  }
}

class _PokemonsGrid extends ConsumerWidget {
  const _PokemonsGrid();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonsId = ref.watch(pokemonIdsProvider);
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
      ),
      itemCount: pokemonsId.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => context.push('/pokemons/${index + 1}'),
          child: Image.network(
            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${index + 1}.png',
            fit: BoxFit.contain,
          ),
        );
      },
    );
  }
}

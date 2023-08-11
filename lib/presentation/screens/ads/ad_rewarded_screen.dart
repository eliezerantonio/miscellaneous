import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscellaneous/presentation/providers/ads/admob_points_provider.dart';
import 'package:miscellaneous/presentation/providers/providers.dart';

class AdRewardedScreen extends ConsumerWidget {
  const AdRewardedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final adRewardedAsync = ref.watch(addRewardedProvider);
    final adPoints = ref.watch(adPointsProvider);

    ref.listen(addRewardedProvider, (pre, next) {
      if (!next.hasValue) return;
      if (next.value == null) return;

      next.value!.show(onUserEarnedReward: (ad, reward) {
        log('Ponos ganhos $reward');

        ref.read(adPointsProvider.notifier).update((state) => state + 10);
      });
    });

    if (adRewardedAsync.isLoading) {
      return const Scaffold(
        body: Center(
          child: Text('Carregando'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ad Rewared'),
      ),
      body: Center(
        child: Text('pontos actuais: $adPoints'),
      ),
    );
  }
}

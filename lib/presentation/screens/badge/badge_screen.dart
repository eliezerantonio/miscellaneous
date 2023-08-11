import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscellaneous/config/configs.dart';
import 'package:miscellaneous/presentation/providers/badge/badge_counter_provider.dart';

const bagRoute = '/badge';

class BadgeScreen extends ConsumerWidget {
  const BadgeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final badgeCounter = ref.watch(badgeCounterProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Center')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Badge(
              alignment: Alignment.lerp(
                  Alignment.topRight, Alignment.bottomRight, 0.2),
              label: Text('$badgeCounter'),
              child: Text(
                badgeCounter.toString(),
                style: const TextStyle(fontSize: 150),
              ),
            ),
            FilledButton.tonal(
              onPressed: () {
                ref.invalidate(badgeCounterProvider);
                AppBadgePlugin.removeBadge();
              },
              child: const Text('Limpar Badge'),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(badgeCounterProvider.notifier).update((state) => state + 1);

          AppBadgePlugin.updateBadgeCount(badgeCounter + 1);
        },
        child: const Icon(Icons.plus_one),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:miscellaneous/presentation/providers/providers.dart';
import 'package:miscellaneous/presentation/widgets/widgets.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final adBannerAsync = ref.watch(addBannerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diversos'),
        actions: [
          IconButton(
            onPressed: () {
              context.push('/settings');
            },
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      body: Column(
        children: [
          const Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: CustomScrollView(
                slivers: [
                  MainMenu(),
                ],
              ),
            ),
          ),

          //!ad banner
          adBannerAsync.when(
            data: (bannderAd) => SizedBox(
              width: bannderAd.size.width.toDouble(),
              height: bannderAd.size.height.toDouble(),
              child: AdWidget(ad: bannderAd),
            ),
            error: (_, __) => Container(),
            loading: () => Container(),
          )
        ],
      ),
    );
  }
}

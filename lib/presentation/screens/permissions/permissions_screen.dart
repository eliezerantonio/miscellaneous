import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/providers.dart';

class PermissionsScreen extends StatelessWidget {
  const PermissionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Permissions'),
      ),
      body: const _PermissionsView(),
    );
  }
}

class _PermissionsView extends ConsumerWidget {
  const _PermissionsView();
  @override
  Widget build(BuildContext contextm, WidgetRef ref) {
    final permissions = ref.watch(permissionsProvider);
    final showAds = ref.watch(showAdsProvider);

    return ListView(
      children: [
        CheckboxListTile(
          value: permissions.cameraGranted,
          title: const Text('Camera'),
          subtitle: Text('${permissions.camera}'),
          onChanged: (value) {
            ref.read(permissionsProvider.notifier).requestCameraAccess();
          },
        ),
        CheckboxListTile(
          value: permissions.photoLibraryGranted,
          title: const Text('Galeria de fotos'),
          subtitle: Text('${permissions.photoLibrary}'),
          onChanged: (value) {
            ref.read(permissionsProvider.notifier).requestPhotoLibraryAcess();
          },
        ),
        CheckboxListTile(
          value: permissions.locationGranted,
          title: const Text('Location'),
          subtitle: Text('${permissions.location}'),
          onChanged: (value) {
            ref.read(permissionsProvider.notifier).requestLocationAccess();
          },
        ),
        CheckboxListTile(
          value: permissions.sensorsGranted,
          title: const Text('Sensors'),
          subtitle: Text('${permissions.sensors}'),
          onChanged: (value) {
            ref.read(permissionsProvider.notifier).requestSensorsAccess();
          },
        ),
        CheckboxListTile(
          value: showAds,
          title: const Text('Mostrar ads'),
          subtitle: const Text('Hide and Show Ads'),
          onChanged: (value) {
            ref.read(showAdsProvider.notifier).toggleAds();
          },
        ),
      ],
    );
  }
}

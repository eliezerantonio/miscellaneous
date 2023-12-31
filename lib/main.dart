import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscellaneous/presentation/providers/providers.dart';
import 'package:workmanager/workmanager.dart';

import 'config/configs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();


  await AdmobPlugin.initialize();

  QuickActionsPlugin.registerActions();


  Workmanager().initialize(callbackDispatcher, isInDebugMode: true);

  // Workmanager().registerOneOffTask('task-identifier', 'simpleTask');

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends ConsumerState<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    ref.read(permissionsProvider.notifier).checkPermissions();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    ref.read(appStateProvider.notifier).state = state;

    if (state == AppLifecycleState.resumed) {
      ref.read(permissionsProvider.notifier).checkPermissions();
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Diverssos',
      theme: AppTheme().getTheme(),
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}

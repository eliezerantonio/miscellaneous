import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscellaneous/config/configs.dart';
import 'package:workmanager/workmanager.dart';

class BackgroundFetchNotifer extends StateNotifier<bool?> {
  final String processKeyName;
  BackgroundFetchNotifer(this.processKeyName) : super(false) {
    checkCurrentStatus();
  }

  checkCurrentStatus() async {
    state = await SharedPreferencesPlugin.getBool(processKeyName) ?? false;
  }

  activateTask() async {
    await Workmanager().registerPeriodicTask(
      processKeyName, processKeyName,
      frequency: const Duration(seconds: 10), //will change to 15 min
      constraints: Constraints(networkType: NetworkType.connected),
      tag: processKeyName,
    );

    await SharedPreferencesPlugin.setBool(processKeyName, true);
    state = true;
  }

  desactivateTask() async {
    await Workmanager().cancelByTag(processKeyName);

    await SharedPreferencesPlugin.setBool(processKeyName, false);

    state = false;
  }

  toggleTask() async {
    if (state == true) {
      desactivateTask();
    } else {
      activateTask();
    }
  }
}

final backgrounFetchProvider = StateNotifierProvider<BackgroundFetchNotifer, bool?>((ref) {
  return BackgroundFetchNotifer(fetchPerioficBackgroundTaskKey);
});

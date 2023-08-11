import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscellaneous/config/configs.dart';

const _storeKey = "showAds";

class ShowAdsNotifier extends StateNotifier<bool> {
  ShowAdsNotifier() : super(true) {
    checkAdsState();
  }

  void checkAdsState() async {
    state = await SharedPreferencesPlugin.getBool(_storeKey) ?? true;
  }

  void removeAds() {
    SharedPreferencesPlugin.setBool(_storeKey, false);
    state = false;
  }

  void showAds() {
    SharedPreferencesPlugin.setBool(_storeKey, true);
    state = true;
  }

  void toggleAds() {
    state ? removeAds() : showAds();
  }
}

final showAdsProvider = StateNotifierProvider<ShowAdsNotifier, bool>((ref) {
  return ShowAdsNotifier();
});

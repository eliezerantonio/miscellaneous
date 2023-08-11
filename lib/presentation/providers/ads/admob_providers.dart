import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:miscellaneous/config/configs.dart';
import 'package:miscellaneous/presentation/providers/ads/show_ads_provider.dart';

final addBannerProvider = FutureProvider<BannerAd>((ref) async {
  final showAds = ref.watch(showAdsProvider);

  if (!showAds) throw 'Ads Blocked';
  final ad = await AdmobPlugin.loadBannerAd();
  return ad;
});


final addInterstitialProvider =  FutureProvider.autoDispose<InterstitialAd>((ref) async {
  final showAds = ref.watch(showAdsProvider);

  if (!showAds) throw 'Ads Blocked';
  final ad = await AdmobPlugin.loadInterstitialAd();
  return ad;
});

final addRewardedProvider = FutureProvider.autoDispose<RewardedAd>((ref) async {
  final showAds = ref.watch(showAdsProvider);

  if (!showAds) throw 'Ads Blocked';
  final ad = await AdmobPlugin.loadRewardedAd();
  return ad;
});

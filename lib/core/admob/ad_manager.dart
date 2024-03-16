class AdManager {
  static bool isTest = true;
  static String bannerHome = isTest
      ? "ca-app-pub-3940256099942544/6300978111"
      : "ca-app-pub-8575403121937936/4313853714";
  static String interstitialHome = isTest
      ? "ca-app-pub-3940256099942544/1033173712"
      : "ca-app-pub-8575403121937936/8468914668";
  static String appOpenAd = isTest
      ? "ca-app-pub-3940256099942544/9257395921"
      : "ca-app-pub-8575403121937936/8930334699";
  static String nativeAd = isTest
      ? "ca-app-pub-3940256099942544/2247696110"
      : "ca-app-pub-8575403121937936/4232256372";
}
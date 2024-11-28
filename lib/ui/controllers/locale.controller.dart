import 'package:get/get.dart';

import 'dart:ui';

import 'package:townsquare/lib.dart';

class AppLocale {
  final String title;
  final String languageCode;
  final String countryCode;
  final String flagAsset;

  AppLocale({
    required this.title,
    required this.languageCode,
    required this.countryCode,
    required this.flagAsset,
  });
}

class LocaleController extends GetxController {
  final Locale defaultLocale = const Locale('en', 'US');
  final List<AppLocale> supportedLocales = <AppLocale>[
    AppLocale(
      title: Get.find<AppStrings>().englishLocaleTitle,
      languageCode: 'en',
      countryCode: 'US',
      flagAsset: 'assets/img/flags/united-states.png',
    ),
    AppLocale(
      title: Get.find<AppStrings>().spanishLocaleTitle,
      languageCode: 'es',
      countryCode: 'ES',
      flagAsset: 'assets/img/flags/colombia.png',
    ),
    AppLocale(
      title: Get.find<AppStrings>().frenchLocaleTitle,
      languageCode: 'fr',
      countryCode: 'FR',
      flagAsset: 'assets/img/flags/french.png',
    ),
    AppLocale(
      title: Get.find<AppStrings>().germanLocaleTitle,
      languageCode: 'de',
      countryCode: 'DE',
      flagAsset: 'assets/img/flags/germany.png',
    ),
    AppLocale(
      title: Get.find<AppStrings>().italianLocaleTitle,
      languageCode: 'it',
      countryCode: 'IT',
      flagAsset: 'assets/img/flags/italy.png',
    ),
    AppLocale(
      title: Get.find<AppStrings>().portugueseLocaleTitle,
      languageCode: 'pt',
      countryCode: 'PT',
      flagAsset: 'assets/img/flags/portugal.png',
    ),
  ];

  late final Rx<Locale> _locale;

  Locale get locale => _locale.value;

  @override
  void onInit() {
    super.onInit();
    _locale = Rx<Locale>(Get.deviceLocale ?? defaultLocale);
    _locale.value = defaultLocale;
  }

  void setLocale(AppLocale locale) {
    _locale.value = Locale(locale.languageCode, locale.countryCode);
  }
}

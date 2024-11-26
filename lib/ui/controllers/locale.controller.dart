import 'package:get/get.dart';

import 'dart:ui';

class LocaleController extends GetxController {
  final Locale defaultLocale = const Locale('en', 'US');
  final List<Locale> supportedLocales = const <Locale>[
    Locale('en', 'US'),
    Locale('es', 'ES'),
  ];

  late final Rx<Locale> _locale;

  Locale get locale => _locale.value;

  @override
  void onInit() {
    super.onInit();
    _locale = Rx<Locale>(Get.deviceLocale ?? defaultLocale);
    _locale.value = defaultLocale;
  }

  void setLocale(Locale locale) {
    _locale.value = locale;
  }
}

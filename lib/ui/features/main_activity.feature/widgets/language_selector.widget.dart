import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:townsquare/lib.dart';

class LanguageSelector extends StatefulWidget {
  final bool isSmall;
  const LanguageSelector({super.key, this.isSmall = false});

  @override
  State<LanguageSelector> createState() => _LanguageSelectorState();
}

class _LanguageSelectorState extends State<LanguageSelector> {
  final List<AppLocale> _supportedLocales =
      Get.find<LocaleController>().supportedLocales;
  AppLocale _currentLocale =
      Get.find<LocaleController>().supportedLocales.first;

  void _showLanguageSelector(TapDownDetails details) {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final Offset offset = renderBox.localToGlobal(details.globalPosition);
    final List<PopupMenuEntry<AppLocale>> items = _supportedLocales
        .map((locale) => PopupMenuItem<AppLocale>(
              value: locale,
              child: Row(
                children: [
                  Image.asset(
                    locale.flagAsset,
                    width: 30,
                    height: 30,
                  ),
                  const SizedBox(width: 10),
                  Text(locale.title.tr),
                ],
              ),
            ))
        .toList();
    showMenu<AppLocale>(
      context: context,
      position:
          RelativeRect.fromLTRB(offset.dx, offset.dy, offset.dx, offset.dy),
      items: items,
    ).then((value) {
      if (value != null) {
        setState(() {
          _currentLocale = value;
          Get.updateLocale(Locale(value.languageCode, value.countryCode));
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = widget.isSmall ? 40.0 : 50.0;
    return GestureDetector(
      onTapDown: _showLanguageSelector,
      child: MouseRegion(
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: Get.find<AppColors>().blackB,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Get.find<AppColors>().white, width: 4),
            image: DecorationImage(
              image: AssetImage(_currentLocale.flagAsset),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:townsquare/lib.dart';

class ThemeSelector extends StatelessWidget {
  final bool isSmall;
  const ThemeSelector({super.key, this.isSmall = false});

  @override
  Widget build(BuildContext context) {
    final size = isSmall ? 40.0 : 50.0;
    return GestureDetector(
      onTap: () {
        Get.find<ThemeController>().changeTheme();
      },
      child: MouseRegion(
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: Get.find<AppColors>().blackB,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Get.find<AppColors>().white, width: 4),
          ),
          child: Center(
            child: Icon(
              Get.find<ThemeController>().isDarkMode
                  ? FontAwesomeIcons.sun
                  : FontAwesomeIcons.moon,
              color: Get.find<AppColors>().white,
            ),
          ),
        ),
      ),
    );
  }
}

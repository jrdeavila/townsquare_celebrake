import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:townsquare/lib.dart';

class ThemeSelector extends StatelessWidget {
  const ThemeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.find<ThemeController>().changeTheme();
      },
      child: MouseRegion(
        child: Container(
          width: 50,
          height: 50,
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

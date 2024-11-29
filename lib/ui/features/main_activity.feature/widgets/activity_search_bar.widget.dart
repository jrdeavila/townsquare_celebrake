import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:townsquare/lib.dart';
import 'package:awesome_icons/awesome_icons.dart';

class ActivitySearchBar extends StatelessWidget {
  const ActivitySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Get.find<AppColors>().white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Get.find<AppColors>().black.withOpacity(0.15),
            blurRadius: 12,
            spreadRadius: 5,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: TextField(
        onChanged: (value) {
          Get.find<ActivityController>().onSearch(value);
        },
        decoration: InputDecoration(
          hintText: Get.find<AppStrings>().activitySearchBarHint.tr,
          suffixIcon: const Icon(FontAwesomeIcons.search),
        ),
      ),
    );
  }
}

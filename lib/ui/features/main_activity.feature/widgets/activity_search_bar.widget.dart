import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:townsquare/lib.dart';
import 'package:awesome_icons/awesome_icons.dart';

class ActivitySearchBar extends StatelessWidget {
  const ActivitySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: Get.find<AppStrings>().activitySearchBarHint.tr,
        suffixIcon: const Icon(FontAwesomeIcons.search),
      ),
    );
  }
}

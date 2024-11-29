import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:townsquare/lib.dart';

class ActivityBottomNavBar extends StatelessWidget {
  const ActivityBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        children: [
          ...Get.find<ActivityController>().bottomItems.map((e) {
            if (e.isButton) {
              return MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Get.find<AppColors>().primary200,
                    shape: BoxShape.circle,
                  ),
                  child: e.prefixIcon,
                ),
              );
            }

            return e.prefixIcon;
          }),
        ].map((e) => Expanded(child: Center(child: e))).toList(),
      ),
    );
  }
}

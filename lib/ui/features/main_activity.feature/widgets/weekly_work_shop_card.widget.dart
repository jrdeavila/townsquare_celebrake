import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:townsquare/lib.dart';

class WeeklyWorkshopCard extends StatelessWidget {
  const WeeklyWorkshopCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: 280,
      decoration: BoxDecoration(
        color: Get.find<AppColors>().secondary200,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(Get.find<AppStrings>().weeklyWorkshopCardTitle.tr,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Get.find<AppColors>().black,
                  )),
          const SizedBox(height: 10),
          Text(Get.find<AppStrings>().weeklyWorkshopCardSubtitle.tr,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Get.find<AppColors>().black,
                  )),
          const SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Get.find<AppColors>().white,
              foregroundColor: Get.find<AppColors>().black,
            ),
            onPressed: () {},
            child: Row(
              children: [
                Expanded(
                    child: Text(
                        Get.find<AppStrings>().weeklyWorkshopCardButton.tr)),
                const Icon(
                  FontAwesomeIcons.arrowRight,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

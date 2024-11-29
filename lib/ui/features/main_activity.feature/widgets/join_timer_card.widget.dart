import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:townsquare/lib.dart';

class JoinTimerCard extends StatelessWidget {
  const JoinTimerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Get.find<AppColors>().primary300,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Get.find<AppStrings>().joinTimerCardTitle.tr,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Get.find<AppColors>().black,
                        overflow: TextOverflow.ellipsis,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  Get.find<AppStrings>().joinTimerCardSubtitle.tr,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Get.find<AppColors>().black,
                        overflow: TextOverflow.ellipsis,
                      ),
                  maxLines: 2,
                ),
                const SizedBox(height: 8),
                Theme(
                  data: Theme.of(context).copyWith(
                    elevatedButtonTheme: ElevatedButtonThemeData(
                        style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(
                        Get.find<AppColors>().black,
                      ),
                      foregroundColor: WidgetStateProperty.all<Color>(
                        Get.find<AppColors>().white,
                      ),
                      shape: WidgetStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    )),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Get.find<ActivityController>()
                                .showSportActivities();
                          },
                          child: Text(
                            Get.find<AppStrings>().joinTimerCardActionJoin.tr,
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: Get.find<AppColors>().white,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            Get.find<AppStrings>()
                                .joinTimerCardActionMyPoints
                                .tr,
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: Get.find<AppColors>().white,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              return ProgressCircleTimer(
                value: Get.find<ActivityController>().pointsPerSportActivity,
                min: 0,
                max: Get.find<ActivityController>().pointsMax,
              );
            }),
          ),
        ],
      ),
    );
  }
}

class ProgressCircleTimer extends StatelessWidget {
  final int value;
  final int min;
  final int max;

  const ProgressCircleTimer(
      {super.key, required this.value, required this.min, required this.max});

  @override
  Widget build(BuildContext context) {
    final valueString = value.toString();
    return Center(
      child: LayoutBuilder(builder: (context, constraints) {
        double size = constraints.biggest.shortestSide;
        size = size > 100 ? 100 : size;
        return SizedBox(
          width: size,
          height: size,
          child: Stack(
            children: [
              Positioned.fill(
                child: CircularProgressIndicator(
                  value: value / max,
                  valueColor: AlwaysStoppedAnimation<Color>(
                      Get.find<AppColors>().primary500),
                  backgroundColor: Get.find<AppColors>().white,
                  strokeWidth: 10,
                  color: Get.find<AppColors>().black,
                  strokeCap: StrokeCap.round,
                  strokeAlign: -0.9,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  valueString,
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        color: Get.find<AppColors>().black,
                      ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

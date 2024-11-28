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
                      ElevatedButton(
                        onPressed: () => throw UnimplementedError(),
                        child: Text(
                          Get.find<AppStrings>().joinTimerCardActionJoin.tr,
                        ),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () => throw UnimplementedError(),
                        child: Text(Get.find<AppStrings>()
                            .joinTimerCardActionMyPoints
                            .tr),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const ProgressCircleTimer(
            progress: 0.5,
            min: 0,
            max: 100,
          ),
        ],
      ),
    );
  }
}

class ProgressCircleTimer extends StatelessWidget {
  final double progress;
  final double min;
  final double max;

  const ProgressCircleTimer(
      {super.key,
      required this.progress,
      required this.min,
      required this.max});

  @override
  Widget build(BuildContext context) {
    final value = (progress * (max - min) + min).toInt().toString();
    return SizedBox(
      width: 100,
      height: 100,
      child: Stack(
        children: [
          Positioned.fill(
            child: CircularProgressIndicator(
              value: progress,
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
              value,
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: Get.find<AppColors>().black,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

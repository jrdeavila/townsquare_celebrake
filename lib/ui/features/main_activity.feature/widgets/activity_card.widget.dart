import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:townsquare/lib.dart';
import 'package:awesome_icons/awesome_icons.dart';

class ActivityScrollableList extends StatelessWidget {
  const ActivityScrollableList({
    super.key,
    required this.activityList,
  });

  final List<ActivityModel> activityList;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const ActivityScrollableDecorator(),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            children: [
              const TodayTargetLabel(),
              const SizedBox(height: 16),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: activityList.map((activity) {
                      return ActivityCard(activity: activity);
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class TodayTargetLabel extends StatelessWidget {
  const TodayTargetLabel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          Get.find<AppStrings>().todayMessage.tr,
          style: Theme.of(context).textTheme.displayLarge,
        ),
        const SizedBox(width: 4),
        Text("/", style: Theme.of(context).textTheme.labelLarge),
        const SizedBox(width: 4),
        Text(
          Get.find<ActivityController>().currentDayOfWeek.tr,
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ],
    );
  }
}

class ActivityScrollableDecorator extends StatelessWidget {
  const ActivityScrollableDecorator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 10,
          height: 10,
          margin: const EdgeInsets.only(right: 3),
          decoration: BoxDecoration(
            color: Get.find<AppColors>().secondary300,
            shape: BoxShape.circle,
          ),
        ),
        Expanded(
          child: CustomPaint(
            painter: DashedLinePainter(
              color: Get.find<AppColors>().neutral500,
            ),
            child: Container(
              width: 3,
            ),
          ),
        ),
      ],
    );
  }
}

class ActivityCard extends StatelessWidget {
  final ActivityModel activity;

  const ActivityCard({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        border: Border.all(
          color: Get.isDarkMode
              ? Get.find<AppColors>().neutral600
              : Get.find<AppColors>().white,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      activity.formattedStartTime,
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "(${activity.formattedDuration})",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  activity.title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(FontAwesomeIcons.mapMarkerAlt,
                        size: 12, color: Get.find<AppColors>().neutral500),
                    const SizedBox(width: 4),
                    Text(
                      activity.place,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(FontAwesomeIcons.user,
                        size: 10, color: Get.find<AppColors>().neutral500),
                    const SizedBox(width: 4),
                    Text(
                      activity.formattedParticipants,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    const SizedBox(width: 8),
                    ...activity.details.map((detail) {
                      return Container(
                        margin: const EdgeInsets.only(right: 4),
                        padding: const EdgeInsets.symmetric(
                          vertical: 3,
                          horizontal: 7,
                        ),
                        decoration: BoxDecoration(
                          color:
                              getColorFromActivityDetail(detail)["background"],
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          getStringFromActivityDetail(detail),
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall
                              ?.copyWith(
                                color:
                                    getColorFromActivityDetail(detail)["title"],
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      );
                    }),
                  ],
                )
              ],
            ),
          ),
          Column(
            children: [
              Text(
                activity.formattedPrice,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 20,
                  ),
                ),
                child: Text(
                  Get.find<AppStrings>().activityCardActionJoin.tr,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
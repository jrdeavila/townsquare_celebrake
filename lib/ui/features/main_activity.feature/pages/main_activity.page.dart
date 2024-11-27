import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:townsquare/lib.dart';

class MainActivityPage extends StatelessWidget {
  const MainActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ActivityAppBar(),
      body: MainActivityView(),
      bottomNavigationBar: ActivityBottomNavBar(),
    );
  }
}

class MainActivityView extends StatelessWidget {
  const MainActivityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isLoading = Get.find<ActivityController>().isLoading;
      final activityList = Get.find<ActivityController>().activityList;
      final categories = Get.find<ActivityController>().categories;
      final selectedCategory = Get.find<ActivityController>().selectedCategory;
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const JoinTimerCard(),
            const SizedBox(height: 16),
            const ActivitySearchBar(),
            const SizedBox(height: 16),
            CategoryScrollableList(
              categories: categories,
              currentCategory: selectedCategory,
            ),
            const SizedBox(height: 16),
            if (isLoading)
              const Expanded(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            if (!isLoading)
              Expanded(
                child: Row(
                  children: [
                    Column(
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
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                Get.find<AppStrings>().todayMessage.tr,
                                style: Theme.of(context).textTheme.displayLarge,
                              ),
                              const SizedBox(width: 4),
                              Text("/",
                                  style:
                                      Theme.of(context).textTheme.labelLarge),
                              const SizedBox(width: 4),
                              Text(
                                Get.find<ActivityController>()
                                    .currentDayOfWeek
                                    .tr,
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                            ],
                          ),
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
                ),
              )
          ],
        ),
      );
    });
  }
}

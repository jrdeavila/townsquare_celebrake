import 'package:awesome_icons/awesome_icons.dart';
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
            const ActivitySearchBar(),
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
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          Get.find<AppStrings>().todayMessage.tr,
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        const SizedBox(width: 4),
                        Text("/",
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      color: Get.find<AppColors>().neutral500,
                                    )),
                        const SizedBox(width: 4),
                        Text(
                          Get.find<ActivityController>().currentDayOfWeek.tr,
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: Get.find<AppColors>().neutral500,
                                  ),
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
              )
          ],
        ),
      );
    });
  }
}

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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Get.find<AppStrings>().joinTimerCardTitle.tr,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                Get.find<AppStrings>().joinTimerCardSubtitle.tr,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 8),
              Row(
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
                    child: Text(
                        Get.find<AppStrings>().joinTimerCardActionMyPoints.tr),
                  ),
                ],
              )
            ],
          ),
          const Spacer(),
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
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

class ActivitySearchBar extends StatelessWidget {
  const ActivitySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: Get.find<AppStrings>().activitySearchBarHint.tr,
          suffixIcon: const Icon(FontAwesomeIcons.search),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class CategoryScrollableList extends StatelessWidget {
  final List<CategoryModel> categories;
  final CategoryModel currentCategory;
  const CategoryScrollableList(
      {super.key, required this.categories, required this.currentCategory});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8),
        scrollDirection: Axis.horizontal,
        children: [
          const CategoryDefaultCard(isSelected: false),
          CategoryCard(
            category: CategoryModel.defaultModel(),
            isSelected: currentCategory == CategoryModel.defaultModel(),
          ),
          ...categories.map((category) {
            return Center(child: CategoryCard(category: category));
          })
        ],
      ),
    );
  }
}

class CategoryDefaultCard extends StatelessWidget {
  final bool isSelected;

  const CategoryDefaultCard({super.key, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: isSelected
            ? Get.find<AppColors>().secondaryB500
            : Get.find<AppColors>().secondaryB300,
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Center(
        child: Icon(FontAwesomeIcons.slidersH),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final CategoryModel category;
  final bool isSelected;

  const CategoryCard(
      {super.key, required this.category, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: isSelected
            ? Get.find<AppColors>().secondaryB500
            : Get.find<AppColors>().secondaryB300,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          category.name,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Get.find<AppColors>().black,
              ),
        ),
      ),
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
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      activity.startTime.format(context),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Get.find<AppColors>().black,
                          ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "(${activity.formattedDuration})",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Get.find<AppColors>().neutral500,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  activity.title,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(FontAwesomeIcons.mapMarkerAlt,
                        size: 12, color: Get.find<AppColors>().neutral500),
                    const SizedBox(width: 4),
                    Text(
                      activity.place,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Get.find<AppColors>().neutral500,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(FontAwesomeIcons.user,
                        size: 10, color: Get.find<AppColors>().neutral500),
                    const SizedBox(width: 4),
                    Text(
                      activity.formattedParticipants,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Get.find<AppColors>().neutral500,
                          ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const Spacer(),
          Column(
            children: [
              Text(
                activity.formattedPrice,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Get.find<AppColors>().black,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () => throw UnimplementedError(),
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

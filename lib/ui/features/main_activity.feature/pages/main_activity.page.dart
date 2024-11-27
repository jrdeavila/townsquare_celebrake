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

class DashedLinePainter extends CustomPainter {
  final Color color;

  DashedLinePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round;

    final max = size.height;
    const dashWidth = 5;
    const dashSpace = 5;
    double startY = 0;

    while (startY < max) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashWidth), paint);
      startY += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
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
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Get.find<AppColors>().black,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                Get.find<AppStrings>().joinTimerCardSubtitle.tr,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Get.find<AppColors>().black,
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
                    color: Get.find<AppColors>().black,
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
    return TextFormField(
      decoration: InputDecoration(
        hintText: Get.find<AppStrings>().activitySearchBarHint.tr,
        suffixIcon: const Icon(FontAwesomeIcons.search),
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
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
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
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        border: Border.all(
          color: Get.find<AppColors>().neutral600,
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

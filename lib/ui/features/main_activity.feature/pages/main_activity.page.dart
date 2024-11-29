import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:townsquare/lib.dart';

class MainActivityPage extends StatelessWidget {
  const MainActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isLoading = Get.find<ActivityController>().isLoading;
      final activityList = Get.find<ActivityController>().activityList;
      final categories = Get.find<ActivityController>().categories;
      final selectedCategory = Get.find<ActivityController>().selectedCategory;
      // ================== Responsive UI ==================
      final isWeb = MediaQuery.of(context).size.width > 1400;
      final isMobile = MediaQuery.of(context).size.width <= 800;

      if (isWeb) {
        return WebActivityPageView(
          categories: categories,
          currentCategory: selectedCategory,
          activityList: activityList,
          isLoading: isLoading,
        );
      }
      if (isMobile) {
        return MobileActivityPageView(
          categories: categories,
          currentCategory: selectedCategory,
          activityList: activityList,
          isLoading: isLoading,
        );
      }
      return TabletActivityPageView(
        categories: categories,
        currentCategory: selectedCategory,
        activityList: activityList,
        isLoading: isLoading,
      );
    });
  }
}

class WebActivityPageView extends StatelessWidget {
  final List<CategoryModel> categories;
  final CategoryModel currentCategory;
  final List<ActivityModel> activityList;
  final bool isLoading;

  const WebActivityPageView({
    super.key,
    required this.categories,
    required this.currentCategory,
    required this.activityList,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const ActivitySidebar(),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const ActivitySearchBar(),
                  const SizedBox(height: 16),
                  CategoryScrollableList(
                    categories: categories,
                    currentCategory: currentCategory,
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
                      child: ActivityScrollableList(
                        activityList: activityList,
                      ),
                    )
                ],
              ),
            ),
          ),
          const Expanded(
            flex: 1,
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Column(
                children: [
                  JoinTimerCard(),
                  SizedBox(height: 20),
                  WeeklyWorkshopCard(),
                  SizedBox(height: 20),
                  PopularEventsCard(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class TabletActivityPageView extends StatelessWidget {
  final List<CategoryModel> categories;
  final CategoryModel currentCategory;
  final List<ActivityModel> activityList;
  final bool isLoading;

  const TabletActivityPageView(
      {super.key,
      required this.categories,
      required this.currentCategory,
      required this.activityList,
      required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const ActivitySidebar(),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const JoinTimerCard(),
                const SizedBox(height: 16),
                const ActivitySearchBar(),
                const SizedBox(height: 16),
                CategoryScrollableList(
                    categories: categories, currentCategory: currentCategory),
                const SizedBox(height: 16),
                if (isLoading)
                  const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                if (!isLoading)
                  Expanded(
                    child: ActivityScrollableList(
                      activityList: activityList,
                    ),
                  )
              ],
            ),
          )),
        ],
      ),
    );
  }
}

class MobileActivityPageView extends StatelessWidget {
  final List<CategoryModel> categories;
  final CategoryModel currentCategory;
  final List<ActivityModel> activityList;
  final bool isLoading;

  const MobileActivityPageView({
    super.key,
    required this.categories,
    required this.currentCategory,
    required this.activityList,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ActivityAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const JoinTimerCard(),
            const SizedBox(height: 16),
            const ActivitySearchBar(),
            const SizedBox(height: 16),
            CategoryScrollableList(
              categories: categories,
              currentCategory: currentCategory,
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
                child: ActivityScrollableList(activityList: activityList),
              )
          ],
        ),
      ),
      bottomNavigationBar: const ActivityBottomNavBar(),
    );
  }
}

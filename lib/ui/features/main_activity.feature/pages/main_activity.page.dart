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
      return CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: JoinTimerCard(),
          ),
          const SliverToBoxAdapter(
            child: ActivitySearchBar(),
          ),
          SliverToBoxAdapter(
            child: CategoryScrollableList(
              categories: categories,
            ),
          ),
          if (isLoading)
            const SliverToBoxAdapter(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          if (!isLoading)
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final activity = activityList[index];
                  return ActivityCard(activity: activity);
                },
                childCount: activityList.length,
              ),
            ),
        ],
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
      child: Column(
        children: [
          const Text(
            "Join Timer",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            "Join a room and start a timer",
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Join Timer"),
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
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search for activities",
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}

class CategoryScrollableList extends StatelessWidget {
  final List<CategoryModel> categories;
  const CategoryScrollableList({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: categories.map((category) {
          return CategoryCard(category: category);
        }).toList(),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final CategoryModel category;

  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(category.name),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(activity.title),
          const SizedBox(height: 8),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

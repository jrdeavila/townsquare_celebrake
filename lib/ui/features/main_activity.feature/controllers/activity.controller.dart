import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:townsquare/lib.dart';

const int _kPointsPerSportActivity = 5;
const int _kPointsMax = 100;

class ActivityController extends GetxController {
  final RxBool _isLoading = true.obs;
  final RxList<ActivityModel> _activityList = <ActivityModel>[].obs;
  final RxList<ActivityJoinModel> _filteredActivityList =
      <ActivityJoinModel>[].obs;
  final RxList<CategoryModel> _categories = <CategoryModel>[].obs;
  final Rx<CategoryModel> _selectedCategory =
      Rx<CategoryModel>(CategoryModel.defaultModel());

  String get currentDateString => formattedDateToActivity(DateTime.now());

  bool get isLoading => _isLoading.value;

  List<ActivityJoinModel> get activityList => _filteredActivityList;

  List<CategoryModel> get categories => _categories;

  CategoryModel get selectedCategory => _selectedCategory.value;

  int get pointsPerSportActivity =>
      _kPointsPerSportActivity *
      _filteredActivityList
          .where((element) =>
              element.isJoined && element.activity.category.id == "1")
          .length;
  int get pointsMax => _kPointsMax;

  String get currentDayOfWeek => dayOfWeek(DateTime.now());

  List<ActivitySidebarItemModel> get sidebarItems => [
        ActivitySidebarItemModel(
          title: Get.find<AppStrings>().activitySidebarActivityLabel,
          onTap: () {},
          prefixIcon: const Icon(
            FontAwesomeIcons.calendar,
          ),
        ),
        ActivitySidebarItemModel(
          title: Get.find<AppStrings>().activitySidebarLocationLabel,
          onTap: () {},
          prefixIcon: const Icon(FontAwesomeIcons.map),
        ),
        ActivitySidebarItemModel(
          title: Get.find<AppStrings>().activitySidebarServicesLabel,
          onTap: () {},
          prefixIcon: const Icon(FontAwesomeIcons.star),
        ),
        ActivitySidebarItemModel(
          title: Get.find<AppStrings>().activitySidebarCommunitiesLabel,
          onTap: () {
            _selectedCategory.value = CategoryModel.defaultModel();
          },
          prefixIcon: const Icon(FontAwesomeIcons.userFriends),
        ),
        ActivitySidebarItemModel(
          title: Get.find<AppStrings>().activitySidebarNotificationsLabel,
          onTap: () {},
          prefixIcon: const Icon(FontAwesomeIcons.bell),
        ),
        ActivitySidebarItemModel(
          title: Get.find<AppStrings>().activitySidebarCreateLabel,
          onTap: () {},
          prefixIcon: const Icon(FontAwesomeIcons.plus),
          isButton: true,
        ),
        ActivitySidebarItemModel(
          title: Get.find<AppStrings>().activitySidebarProfileLabel,
          onTap: () {},
          prefixIcon: const CircleAvatar(
            radius: 15,
            backgroundImage: AssetImage('assets/img/profile.png'),
          ),
          suffixIcon: const Icon(FontAwesomeIcons.ellipsisV),
        ),
      ];

  List<ActivitySidebarItemModel> get bottomItems => [
        ActivitySidebarItemModel(
          title: Get.find<AppStrings>().activitySidebarActivityLabel,
          onTap: () {},
          prefixIcon: const Icon(
            FontAwesomeIcons.calendar,
          ),
        ),
        ActivitySidebarItemModel(
          title: Get.find<AppStrings>().activitySidebarLocationLabel,
          onTap: () {},
          prefixIcon: const Icon(FontAwesomeIcons.map),
        ),
        ActivitySidebarItemModel(
          title: Get.find<AppStrings>().activitySidebarCreateLabel,
          onTap: () {},
          prefixIcon: const Icon(FontAwesomeIcons.plus),
          isButton: true,
        ),
        ActivitySidebarItemModel(
          title: Get.find<AppStrings>().activitySidebarServicesLabel,
          onTap: () {},
          prefixIcon: const Icon(FontAwesomeIcons.star),
        ),
        ActivitySidebarItemModel(
          title: Get.find<AppStrings>().activitySidebarCommunitiesLabel,
          onTap: () {
            _selectedCategory.value = CategoryModel.defaultModel();
          },
          prefixIcon: const Icon(FontAwesomeIcons.userFriends),
        ),
      ];

  List<ActivitySidebarItemModel> get topItems => [
        ActivitySidebarItemModel(
          title: Get.find<AppStrings>().activitySidebarNotificationsLabel,
          onTap: () {},
          prefixIcon: Icon(FontAwesomeIcons.bell,
              size: 30.0,
              color: Get.find<ThemeController>().isDarkMode
                  ? Get.find<AppColors>().white
                  : Get.find<AppColors>().black),
        ),
        ActivitySidebarItemModel(
          title: Get.find<AppStrings>().activitySidebarProfileLabel,
          onTap: () {},
          prefixIcon: const CircleAvatar(
            backgroundImage: AssetImage('assets/img/profile.png'),
          ),
          suffixIcon: const Icon(FontAwesomeIcons.ellipsisV),
        ),
      ];

  @override
  void onInit() {
    super.onInit();
    _fetchActivityList();
    _fetchCategories();
    ever(_selectedCategory, _onCategorySelected);
    ever(_activityList, (_) {
      _filteredActivityList.assignAll(_activityList.map((activity) {
        return ActivityJoinModel(
          activity: activity,
          isJoined: _filteredActivityList.contains(activity),
        );
      }));
    });
  }

  void _onCategorySelected(CategoryModel category) {
    if (category.id == "0") {
      _fetchActivityList();
    } else {
      final filteredList = _activityList.where((activity) {
        return activity.category.id == category.id;
      }).toList();
      _filteredActivityList.assignAll(filteredList.map((activity) {
        return ActivityJoinModel(
          activity: activity,
          isJoined: _filteredActivityList.contains(activity),
        );
      }));
    }
  }

  void _fetchActivityList() async {
    _isLoading.value = true;
    final activityList =
        await Get.find<ActivityModelService>().fetchActivityModel();
    _activityList.assignAll(activityList);
    _isLoading.value = false;
  }

  void _fetchCategories() async {
    final categories =
        await Get.find<ActivityModelService>().fetchCategoryModel();
    _categories.assignAll(categories);
  }

  void onSearch(String query) {
    if (query.isEmpty) {
      _filteredActivityList.assignAll(_activityList.map((activity) {
        return ActivityJoinModel(
          activity: activity,
          isJoined: _filteredActivityList.contains(activity),
        );
      }));
    } else {
      final filteredList = _activityList.where((activity) {
        return activity.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
      _filteredActivityList.assignAll(filteredList.map((activity) {
        return ActivityJoinModel(
          activity: activity,
          isJoined: _filteredActivityList.contains(activity),
        );
      }));
    }
  }

  void onCategorySelected(CategoryModel category) {
    _selectedCategory.value = category;
  }

  void onJoinActivity(ActivityModel activity) {
    final index = _filteredActivityList.indexWhere((element) {
      return element.activity == activity;
    });
    _filteredActivityList.replaceRange(index, index + 1, [
      ActivityJoinModel(
        activity: activity,
        isJoined: !_filteredActivityList[index].isJoined,
      )
    ]);
  }

  bool onJoinedActivity(ActivityModel activity) {
    return _filteredActivityList
        .firstWhere((element) => element.activity == activity,
            orElse: () =>
                ActivityJoinModel(activity: activity, isJoined: false))
        .isJoined;
  }

  void onLeaveActivity(ActivityModel activity) {
    final index = _filteredActivityList.indexWhere((element) {
      return element.activity == activity;
    });
    _filteredActivityList.replaceRange(index, index + 1, [
      ActivityJoinModel(
        activity: activity,
        isJoined: !_filteredActivityList[index].isJoined,
      )
    ]);
  }

  void showSportActivities() {
    _selectedCategory.value = _categories.firstWhere(
      (element) => element.id == "1",
      orElse: () => CategoryModel.defaultModel(),
    );
  }
}

// Tues, 12 Jan
String formattedDateToActivity(DateTime date) {
  return "${dayOfWeek(date).tr}, ${date.day} ${month(date).tr}";
}

String dayOfWeek(DateTime date) {
  switch (date.weekday) {
    case 1:
      return Get.find<AppStrings>().mondaySmallLabel;
    case 2:
      return Get.find<AppStrings>().tuesdaySmallLabel;
    case 3:
      return Get.find<AppStrings>().wednesdaySmallLabel;
    case 4:
      return Get.find<AppStrings>().thursdaySmallLabel;
    case 5:
      return Get.find<AppStrings>().fridaySmallLabel;
    case 6:
      return Get.find<AppStrings>().saturdaySmallLabel;
    case 7:
      return Get.find<AppStrings>().sundaySmallLabel;
    default:
      return "";
  }
}

String month(DateTime date) {
  switch (date.month) {
    case 1:
      return Get.find<AppStrings>().januarySmallLabel;
    case 2:
      return Get.find<AppStrings>().februarySmallLabel;
    case 3:
      return Get.find<AppStrings>().marchSmallLabel;
    case 4:
      return Get.find<AppStrings>().aprilSmallLabel;
    case 5:
      return Get.find<AppStrings>().maySmallLabel;
    case 6:
      return Get.find<AppStrings>().juneSmallLabel;
    case 7:
      return Get.find<AppStrings>().julySmallLabel;
    case 8:
      return Get.find<AppStrings>().augustSmallLabel;
    case 9:
      return Get.find<AppStrings>().septemberSmallLabel;
    case 10:
      return Get.find<AppStrings>().octoberSmallLabel;
    case 11:
      return Get.find<AppStrings>().novemberSmallLabel;
    case 12:
      return Get.find<AppStrings>().decemberSmallLabel;
    default:
      return "";
  }
}

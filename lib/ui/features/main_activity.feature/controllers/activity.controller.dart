import 'package:get/get.dart';
import 'package:townsquare/lib.dart';

class ActivityController extends GetxController {
  final RxBool _isLoading = true.obs;
  final RxList<ActivityModel> _activityList = <ActivityModel>[].obs;
  final RxList<CategoryModel> _categories = <CategoryModel>[].obs;
  String get currentDateString => formattedDateToActivity(DateTime.now());
  bool get isLoading => _isLoading.value;
  List<ActivityModel> get activityList => _activityList;
  List<CategoryModel> get categories => _categories;

  @override
  void onInit() {
    super.onInit();
    _fetchActivityList();
    _fetchCategories();
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
    final filteredList = _activityList.where((activity) {
      return activity.title.toLowerCase().contains(query.toLowerCase());
    }).toList();
    _activityList.assignAll(filteredList);
  }

  void onCategorySelected(CategoryModel category) {
    final filteredList = _activityList.where((activity) {
      return activity.category.id == category.id;
    }).toList();
    _activityList.assignAll(filteredList);
  }
}

// Tues, 12 Jan
String formattedDateToActivity(DateTime date) {
  return "${_dayOfWeek(date)}, ${date.day} ${_month(date)}";
}

String _dayOfWeek(DateTime date) {
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

String _month(DateTime date) {
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

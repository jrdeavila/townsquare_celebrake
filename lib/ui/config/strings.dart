import 'package:get/get.dart';

class AppStrings {
  static AppStrings? _instance;
  static AppStrings getInstance() {
    _instance ??= AppStrings();
    return _instance!;
  }

  final String appName = "TownSquare App".tr;
  final String thisWeekMessage = "this_week_message".tr;
  final String todayMessage = "today_message".tr;
  final String homeBottomNavTitle = "home_bottom_nav_title".tr;
  final String calendarBottomNavTitle = "calendar_bottom_nav_title".tr;
  final String profileBottomNavTitle = "profile_bottom_nav_title".tr;

  // Dates
  final String today = "today".tr;
  final String tomorrow = "tomorrow".tr;
  final String yesterday = "yesterday".tr;
  // Days
  final String mondaySmallLabel = "monday_small_label".tr;
  final String tuesdaySmallLabel = "tuesday_small_label".tr;
  final String wednesdaySmallLabel = "wednesday".tr;
  final String thursdaySmallLabel = "thursday_small_label".tr;
  final String fridaySmallLabel = "friday_small_label".tr;
  final String saturdaySmallLabel = "saturday_small_label".tr;
  final String sundaySmallLabel = "sunday_small_label".tr;
  // Months
  final String januarySmallLabel = "january_small_label".tr;
  final String februarySmallLabel = "february_small_label".tr;
  final String marchSmallLabel = "march_small_label".tr;
  final String aprilSmallLabel = "april_small_label".tr;
  final String maySmallLabel = "may_small_label".tr;
  final String juneSmallLabel = "june_small_label".tr;
  final String julySmallLabel = "july_small_label".tr;
  final String augustSmallLabel = "august_small_label".tr;
  final String septemberSmallLabel = "september_small_label".tr;
  final String octoberSmallLabel = "october_small_label".tr;
  final String novemberSmallLabel = "november_small_label".tr;
  final String decemberSmallLabel = "december_small_label".tr;
}

class AppStrings {
  static AppStrings? _instance;
  static AppStrings getInstance() {
    _instance ??= AppStrings();
    return _instance!;
  }

  final String appName = "TownSquare App";
  final String thisWeekMessage = "this_week_message";
  final String todayMessage = "today_message";
  final String homeBottomNavTitle = "home_bottom_nav_title";
  final String calendarBottomNavTitle = "calendar_bottom_nav_title";
  final String profileBottomNavTitle = "profile_bottom_nav_title";

  // Dates
  final String today = "today";
  final String tomorrow = "tomorrow";
  final String yesterday = "yesterday";
  // Days
  final String mondaySmallLabel = "monday_small_label";
  final String tuesdaySmallLabel = "tuesday_small_label";
  final String wednesdaySmallLabel = "wednesday";
  final String thursdaySmallLabel = "thursday_small_label";
  final String fridaySmallLabel = "friday_small_label";
  final String saturdaySmallLabel = "saturday_small_label";
  final String sundaySmallLabel = "sunday_small_label";
  // Months
  final String januarySmallLabel = "january_small_label";
  final String februarySmallLabel = "february_small_label";
  final String marchSmallLabel = "march_small_label";
  final String aprilSmallLabel = "april_small_label";
  final String maySmallLabel = "may_small_label";
  final String juneSmallLabel = "june_small_label";
  final String julySmallLabel = "july_small_label";
  final String augustSmallLabel = "august_small_label";
  final String septemberSmallLabel = "september_small_label";
  final String octoberSmallLabel = "october_small_label";
  final String novemberSmallLabel = "november_small_label";
  final String decemberSmallLabel = "december_small_label";
  // Activity Screen
  final String joinTimerCardTitle = "join_timer_card_title";
  final String joinTimerCardSubtitle = "join_timer_card_subtitle";
  final String joinTimerCardActionJoin = "action_join";
  final String joinTimerCardActionMyPoints = "action_my_points";
  final String activitySearchBarHint = "activity_search_bar_hint";
  final String spotsLeftLabel = "spots_left_label";
  final String currencySymbol = "currency_symbol";
  final String activityCardActionJoin = "activity_card_action_join";
  final String activitySidebarActivityLabel = "activity_sidebar_activity_label";
  final String activitySidebarCommunitiesLabel =
      "activity_sidebar_communities_label";
  final String activitySidebarLocationLabel = "activity_sidebar_location_label";
  final String activitySidebarCreateLabel = "activity_sidebar_create_label";
  final String activitySidebarNotificationsLabel =
      "activity_sidebar_notifications_label";
  final String activitySidebarServicesLabel = "activity_sidebar_services_label";
  final String weeklyWorkshopCardButton = "weekly_workshop_card_button";
  final String weeklyWorkshopCardTitle = "weekly_workshop_card_title";
  final String weeklyWorkshopCardSubtitle = "weekly_workshop_card_subtitle";
  final String popularEventsCardButton = "popular_events_card_button";
  final String popularEventsCardTitle = "popular_events_card_title";
  final String popularEventsCardSubtitle = "popular_events_card_subtitle";
}

import 'package:get/get.dart';
import 'package:townsquare/lib.dart';

class MainRoutes {
  static const String mainActivity = "/main-activity";
  static const String defaultHomeRoute = mainActivity;
  static final List<GetPage> routes = [
    GetPage(
      name: mainActivity,
      page: () => const MainActivityPage(),
      binding: MainActivityBinding(),
    ),
  ];
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:townsquare/lib.dart';

part 'app.dart';

void main() {
  runZonedGuarded(() {
    WidgetsFlutterBinding.ensureInitialized();
    configureDependencies();
    runApp(const MyApp());
  }, (exc, stc) {
    if (exc is AppException) {
      Get.find<ExceptionController>().addException(exc);
    } else {
      Get.find<ExceptionController>().addException(
        AppException.unknown(),
      );
    }
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => GetMaterialApp(
          title: Get.find<AppStrings>().appName,
          themeMode: Get.find<ThemeController>().isDarkMode
              ? ThemeMode.dark
              : ThemeMode.light,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: "SF Pro Display",
            scaffoldBackgroundColor: Get.find<AppColors>().neutral100,
            shadowColor: Get.find<AppColors>().black,
            bottomAppBarTheme: BottomAppBarTheme(
              color: Get.find<AppColors>().white,
              elevation: 10,
            ),
          ),
          darkTheme: ThemeData(
            fontFamily: "SF Pro Display",
            scaffoldBackgroundColor: Get.find<AppColors>().blackB,
            shadowColor: Get.find<AppColors>().black,
            bottomAppBarTheme: BottomAppBarTheme(
              color: Get.find<AppColors>().black,
            ),
          ),
          getPages: MainRoutes.routes,
          initialRoute: MainRoutes.defaultHomeRoute,
        ));
  }
}

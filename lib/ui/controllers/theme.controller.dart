import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:townsquare/lib.dart';

/// A controller for managing the theme of the application.
///
/// This controller uses the GetX package to manage the state of the theme.
/// It provides a way to toggle between dark mode and light mode.
class ThemeController extends GetxController {
  /// A reactive boolean that indicates whether the dark mode is enabled.
  final RxBool _isDarkMode = false.obs;

  /// Returns `true` if dark mode is enabled, otherwise `false`.
  bool get isDarkMode => _isDarkMode.value;

  ThemeData get lightTheme => ThemeData(
        fontFamily: "SF Pro Display",
        scaffoldBackgroundColor: Get.find<AppColors>().neutral100,
        shadowColor: Get.find<AppColors>().black,
        bottomAppBarTheme: BottomAppBarTheme(
          color: Get.find<AppColors>().white,
          elevation: 10,
        ),
        textTheme: TextTheme(
          headlineLarge: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Get.find<AppColors>().black,
          ),
          headlineMedium: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Get.find<AppColors>().black,
          ),
          headlineSmall: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Get.find<AppColors>().black,
          ),
          bodyLarge: TextStyle(
            fontSize: 18,
            color: Get.find<AppColors>().black,
          ),
          bodyMedium: TextStyle(
            fontSize: 16,
            color: Get.find<AppColors>().black,
          ),
          bodySmall: TextStyle(
            fontSize: 14,
            color: Get.find<AppColors>().black,
          ),
          labelLarge: TextStyle(
            fontSize: 18,
            color: Get.find<AppColors>().neutral500,
          ),
          labelMedium: TextStyle(
            fontSize: 16,
            color: Get.find<AppColors>().neutral500,
          ),
          labelSmall: TextStyle(
            fontSize: 14,
            color: Get.find<AppColors>().neutral500,
          ),
          titleLarge: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Get.find<AppColors>().black,
          ),
          titleMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Get.find<AppColors>().black,
          ),
          titleSmall: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Get.find<AppColors>().black,
          ),
          displayLarge: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Get.find<AppColors>().black,
          ),
          displayMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Get.find<AppColors>().black,
          ),
          displaySmall: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Get.find<AppColors>().black,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            textStyle: WidgetStateProperty.all(
              const TextStyle(
                fontSize: 14,
              ),
            ),
            backgroundColor: WidgetStateProperty.all(
              Get.find<AppColors>().black,
            ),
            foregroundColor: WidgetStateProperty.all(
              Get.find<AppColors>().white,
            ),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            padding: WidgetStateProperty.all(
              const EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 10,
              ),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          fillColor: Get.find<AppColors>().white,
          filled: true,
          hintStyle: TextStyle(
            fontSize: 16,
            color: Get.find<AppColors>().neutral500,
          ),
        ),
      );

  ThemeData get darkTheme => ThemeData(
        fontFamily: "SF Pro Display",
        scaffoldBackgroundColor: Get.find<AppColors>().blackB,
        shadowColor: Get.find<AppColors>().black,
        bottomAppBarTheme: BottomAppBarTheme(
          color: Get.find<AppColors>().black,
        ),
        textTheme: TextTheme(
          headlineLarge: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Get.find<AppColors>().white,
          ),
          headlineMedium: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Get.find<AppColors>().white,
          ),
          headlineSmall: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Get.find<AppColors>().white,
          ),
          bodyLarge: TextStyle(
            fontSize: 18,
            color: Get.find<AppColors>().white,
          ),
          bodyMedium: TextStyle(
            fontSize: 16,
            color: Get.find<AppColors>().white,
          ),
          bodySmall: TextStyle(
            fontSize: 14,
            color: Get.find<AppColors>().white,
          ),
          labelLarge: TextStyle(
            fontSize: 18,
            color: Get.find<AppColors>().neutral500,
          ),
          labelMedium: TextStyle(
            fontSize: 16,
            color: Get.find<AppColors>().neutral500,
          ),
          labelSmall: TextStyle(
            fontSize: 14,
            color: Get.find<AppColors>().neutral500,
          ),
          titleLarge: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Get.find<AppColors>().white,
          ),
          titleMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Get.find<AppColors>().white,
          ),
          titleSmall: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Get.find<AppColors>().white,
          ),
          displayLarge: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Get.find<AppColors>().white,
          ),
          displayMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Get.find<AppColors>().white,
          ),
          displaySmall: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Get.find<AppColors>().white,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            textStyle: WidgetStateProperty.all(
              const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor: WidgetStateProperty.all(
              Get.find<AppColors>().white,
            ),
            foregroundColor: WidgetStateProperty.all(
              Get.find<AppColors>().black,
            ),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            padding: WidgetStateProperty.all(
              const EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 10,
              ),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          fillColor: Get.find<AppColors>().white,
          filled: true,
          hintStyle: TextStyle(
            fontSize: 16,
            color: Get.find<AppColors>().neutral500,
          ),
        ),
      );

  /// Toggles the theme between dark mode and light mode.
  void changeTheme() {
    _isDarkMode.value = !_isDarkMode.value;
  }
}

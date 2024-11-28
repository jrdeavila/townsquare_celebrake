/// A singleton class that defines a set of color constants used throughout the application.
///
/// The `AppColors` class provides a centralized place to manage and access color values.
/// It follows the singleton pattern to ensure that only one instance of the class is created.
///
/// Example usage:
/// ```dart
/// final colors = AppColors.getInstance();
/// print(colors.primary600); // Accessing a color value
/// ```
///
/// Color definitions:
/// - `lightIntensity`: A light blue color.
/// - `lightIntensityTitle`: A medium blue color.
/// - `mediumIntensity`: A light purple color.
/// - `mediumIntensityTitle`: A light purple color.
/// - `highIntensity`: A light orange color.
/// - `highIntensityTitle`: A medium orange color.
/// - `veryHighIntensity`: A light pink color.
/// - `veryHighIntensityTitle`: A medium pink color.
/// - `childCareTag`: A light green color.
/// - `workplaceTag`: A light purple color.
/// - `childCareTitle`: A medium green color.
/// - `primary600`: A dark blue color.
/// - `primary500`: A medium blue color.
/// - `primary400`: A light blue color.
/// - `primary300`: A lighter blue color.
/// - `primary200`: A very light blue color.
/// - `primary100`: A very light blue color.
/// - `neutral600`: A dark gray color.
/// - `neutral500`: A medium gray color.
/// - `neutral400`: A light gray color.
/// - `neutral300`: A lighter gray color.
/// - `neutral200`: A very light gray color.
/// - `neutral100`: A very light gray color.
/// - `black`: Black color.
/// - `white`: White color.
/// - `secondary600`: A dark yellow color.
/// - `secondary500`: A medium yellow color.
/// - `secondary400`: A light yellow color.
/// - `secondary300`: A lighter yellow color.
/// - `secondary200`: A very light yellow color.
/// - `secondary100`: A very light yellow color.
/// - `secondaryB600`: A dark purple color.
/// - `secondaryB500`: A medium purple color.
/// - `secondaryB400`: A light purple color.
/// - `secondaryB300`: A lighter purple color.
/// - `secondaryB200`: A very light purple color.
/// - `secondaryB100`: A very light purple color.
library;

import 'dart:ui';

class AppColors {
  static AppColors? _instance;

  static AppColors getInstance() {
    _instance ??= AppColors._();
    return _instance!;
  }

  AppColors._();

  final Color lightIntensity = const Color(0xFFD5F1FF);
  final Color lightIntensityTitle = const Color(0xFF65B5DB);
  final Color mediumIntensity = const Color(0xFFF3E8FF);
  final Color mediumIntensityTitle = const Color(0xFFC9A4F2);
  final Color highIntensity = const Color(0xFFFFEAD1);
  final Color highIntensityTitle = const Color(0xFFDC974F);
  final Color veryHighIntensity = const Color(0xFFFFE0E4);
  final Color veryHighIntensityTitle = const Color(0xFFD98792);
  final Color childCareTag = const Color(0xFFD8F7DF);
  final Color workplaceTag = const Color(0xFF989AEA);
  final Color childCareTitle = const Color(0xFF8AB58A);
  final Color primary600 = const Color(0xFF35BAF8);
  final Color primary500 = const Color(0xFF4FC7FF);
  final Color primary400 = const Color(0xFF7FD6FF);
  final Color primary300 = const Color(0xFFA1E1FF);
  final Color primary200 = const Color(0xFFC1EBFF);
  final Color primary100 = const Color(0xFFD5F1FF);
  final Color neutral600 = const Color(0xFF6C757D);
  final Color neutral500 = const Color(0xFFADB5BD);
  final Color neutral400 = const Color(0xFFCED4DA);
  final Color neutral300 = const Color(0xFFDEE2E6);
  final Color neutral200 = const Color(0xFFE9ECEF);
  final Color neutral100 = const Color(0xFFF8F9FA);
  final Color black = const Color(0xFF000000);
  final Color blackB = const Color(0xFF0E0E0E);
  final Color white = const Color(0xFFFFFFFF);
  final Color secondary600 = const Color(0xFFEBCF30);
  final Color secondary500 = const Color(0xFFF6DB43);
  final Color secondary400 = const Color(0xFFFFE764);
  final Color secondary300 = const Color(0xFFFFF09C);
  final Color secondary200 = const Color(0xFFFFF09C);
  final Color secondary100 = const Color(0xFFFFF8EB);
  final Color secondaryB600 = const Color(0xFF7C5D8E);
  final Color secondaryB500 = const Color(0xFFAC84C3);
  final Color secondaryB400 = const Color(0xFFBAA1C8);
  final Color secondaryB300 = const Color(0xFFE5D5EE);
  final Color secondaryB200 = const Color(0xFFEEE1F5);
  final Color secondaryB100 = const Color(0xFFFBF4FF);
}

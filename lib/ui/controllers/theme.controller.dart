import 'package:get/get.dart';

/// A controller for managing the theme of the application.
///
/// This controller uses the GetX package to manage the state of the theme.
/// It provides a way to toggle between dark mode and light mode.
class ThemeController extends GetxController {
  /// A reactive boolean that indicates whether the dark mode is enabled.
  final RxBool _isDarkMode = false.obs;

  /// Returns `true` if dark mode is enabled, otherwise `false`.
  bool get isDarkMode => _isDarkMode.value;

  /// Toggles the theme between dark mode and light mode.
  void changeTheme() {
    _isDarkMode.value = !_isDarkMode.value;
  }
}

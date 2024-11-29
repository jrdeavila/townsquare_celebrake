import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:townsquare/lib.dart';

class ExceptionController extends GetxController {
  final RxList<AppException> _exceptions = <AppException>[].obs;

  @override
  void onReady() {
    super.onReady();
    ever(_exceptions, _showExceptionQueue);
  }

  void addException(AppException exception) {
    _exceptions.add(exception);
  }

  void _showExceptionQueue(List<AppException> exceptions) {
    if (exceptions.isNotEmpty) {
      final exception = exceptions.first;
      Get.snackbar(
        exception.title ?? 'Error',
        exception.message,
        margin: const EdgeInsets.all(16),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: _getBackgroundColor(exception.severity),
        colorText: _getTextColor(exception.severity),
      );
    }
  }

  Color _getBackgroundColor(AppExceptionSeverity severity) {
    switch (severity) {
      case AppExceptionSeverity.error:
        return Colors.red;
      case AppExceptionSeverity.warning:
        return Colors.orange;
      case AppExceptionSeverity.info:
        return Colors.blue;
      case AppExceptionSeverity.success:
        return Colors.green;
    }
  }

  Color _getTextColor(AppExceptionSeverity severity) {
    switch (severity) {
      case AppExceptionSeverity.error:
        return Colors.white;
      case AppExceptionSeverity.warning:
        return Colors.black;
      case AppExceptionSeverity.info:
        return Colors.white;
      case AppExceptionSeverity.success:
        return Colors.white;
    }
  }
}

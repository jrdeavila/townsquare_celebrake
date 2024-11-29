import 'package:get/get.dart';

enum ResponsiveMode { web, tablet, mobile }

class ResponsiveController extends GetxController {
  bool get isWeb => Get.width > 1400;
  bool get isTablet => Get.width >= 768 && Get.width <= 1400;
  bool get isMobile => Get.width < 768;
  bool get isMobileMD => Get.width <= 500;
  bool get isMobileSM => Get.width <= 400;
}

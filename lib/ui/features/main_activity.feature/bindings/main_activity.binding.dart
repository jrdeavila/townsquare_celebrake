import 'package:get/get.dart';
import 'package:townsquare/lib.dart';

class MainActivityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ActivityController>(() => ActivityController());
  }
}

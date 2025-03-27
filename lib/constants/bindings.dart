import 'package:get/get.dart';
import 'package:shroom_card/controllers/home_controller.dart';
import 'package:shroom_card/controllers/splash_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => SplashController(), fenix: true);
    Get.lazyPut(() => SplashController(), fenix: true);
  }
}

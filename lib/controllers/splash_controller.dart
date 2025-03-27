import 'package:get/get.dart';
import 'package:shroom_card/constants/extensions.dart';
import 'package:shroom_card/constants/strings.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Future.delayed(5.sec, () => Get.offNamed(AppStrings.homeRoute));
    super.onInit();
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shroom_card/constants/colors.dart';
import 'package:shroom_card/constants/extensions.dart';
import 'package:shroom_card/constants/strings.dart';
import 'package:shroom_card/controllers/splash_controller.dart';

class SplashScreen extends GetWidget<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppStrings.logoImage, width: 200, height: 200),
              25.gap,
              const Text(AppStrings.appTitle, style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: AppColors.greenColor)),
              5.gap,
              const Text(AppStrings.appSubTitle, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.greenColor)),
              50.gap,
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(height: 30, width: 30, child: Center(child: 30.darkLoading)),
    );
  }
}

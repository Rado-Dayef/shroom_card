import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shroom_card/constants/bindings.dart';
import 'package:shroom_card/constants/colors.dart';
import 'package:shroom_card/constants/pages.dart';
import 'package:shroom_card/constants/strings.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: AppColors.lightGreyColor));
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appTitle,
      getPages: AppPages.appPages,
      theme: ThemeData(highlightColor: AppColors.transparentColor, splashColor: AppColors.transparentColor),
      initialBinding: AppBindings(),
      initialRoute: AppStrings.splashRoute,
    );
  }
}

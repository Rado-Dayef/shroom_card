import 'package:get/get.dart';
import 'package:shroom_card/constants/strings.dart';
import 'package:shroom_card/views/screens/details_screen.dart';
import 'package:shroom_card/views/screens/home_screen.dart';
import 'package:shroom_card/views/screens/splash_screen.dart';

class AppPages {
  static List<GetPage> appPages = [
    GetPage(name: AppStrings.homeRoute, page: () => const HomeScreen(), transition: Transition.noTransition),
    GetPage(name: AppStrings.splashRoute, page: () => const SplashScreen(), transition: Transition.noTransition),
    GetPage(name: AppStrings.detailsRoute, page: () => const DetailsScreen(), transition: Transition.noTransition),
  ];
}

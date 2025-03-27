import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:shroom_card/constants/colors.dart';
import 'package:shroom_card/constants/extensions.dart';
import 'package:shroom_card/constants/strings.dart';
import 'package:shroom_card/controllers/home_controller.dart';
import 'package:shroom_card/models/category_model.dart';
import 'package:shroom_card/models/mushroom_model.dart';
import 'package:shroom_card/views/widgets/home_category_widget.dart';
import 'package:shroom_card/views/widgets/home_library_plant_widget.dart';

class HomeScreen extends GetWidget<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.15),
          child: Column(
            children: [
              10.gap,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(radius: 20, backgroundColor: AppColors.lightGreenColor, foregroundColor: AppColors.greenColor, child: Image.asset(AppStrings.logoImage)),
                        5.gap,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(AppStrings.welcomeToText, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.secLightGreenColor, fontSize: 18)),
                            Text(AppStrings.appTitle, style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              10.gap,
              Padding(
                padding: 10.edgeInsetsHorizontal,
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          controller.isBrowse = true;
                          controller.update();
                        },
                        child: GetBuilder<HomeController>(
                          builder: (_) {
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: controller.isBrowse ? AppColors.greenColor : AppColors.secLightGreenColor),
                                color: controller.isBrowse ? AppColors.lightGreenColor : AppColors.whiteColor,
                              ),
                              alignment: Alignment.center,
                              padding: 10.edgeInsetsAll,
                              child: Text(AppStrings.browseText, style: TextStyle(color: controller.isBrowse ? AppColors.greenColor : AppColors.secLightGreenColor)),
                            );
                          },
                        ),
                      ),
                    ),
                    15.gap,
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          controller.isBrowse = false;
                          controller.update();
                        },
                        child: GetBuilder<HomeController>(
                          builder: (_) {
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: !controller.isBrowse ? AppColors.greenColor : AppColors.secLightGreenColor),
                                color: !controller.isBrowse ? AppColors.lightGreenColor : AppColors.whiteColor,
                              ),
                              alignment: Alignment.center,
                              padding: 10.edgeInsetsAll,
                              child: Text(AppStrings.identifyText, style: TextStyle(color: !controller.isBrowse ? AppColors.greenColor : AppColors.secLightGreenColor)),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: SizedBox(
          height: double.infinity,
          child: SingleChildScrollView(
            child: GetBuilder<HomeController>(
              builder: (_) {
                return controller.isBrowse
                    ? Column(
                      children: [
                        10.gap,
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: TextFormField(
                            controller: controller.searchController,
                            enableInteractiveSelection: false,
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(),
                            cursorColor: AppColors.darkWhiteColor,
                            onTapOutside: (_) {
                              controller.update();
                              FocusScope.of(context).unfocus();
                            },
                            decoration: InputDecoration(
                              fillColor: AppColors.lightGreenColor,
                              filled: true,
                              border: OutlineInputBorder(borderRadius: 15.borderRadiusAll),
                              focusedBorder: OutlineInputBorder(borderRadius: 10.borderRadiusAll),
                              enabledBorder: OutlineInputBorder(borderRadius: 10.borderRadiusAll),
                              disabledBorder: OutlineInputBorder(borderRadius: 10.borderRadiusAll),
                              focusedErrorBorder: OutlineInputBorder(borderRadius: 10.borderRadiusAll),

                              prefixIcon: InkWell(
                                onTap: () {
                                  controller.update();
                                  FocusScope.of(context).unfocus();
                                },
                                child: const Icon(Icons.search, color: AppColors.darkWhiteColor),
                              ),
                              hintText: AppStrings.searchHereText,
                              hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.darkWhiteColor),
                            ),
                          ),
                        ),
                        10.gap,
                        Row(children: [15.gap, Text(AppStrings.categoryText, style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold))]),
                        10.gap,
                        SizedBox(
                          height: 25,
                          child: GetBuilder<HomeController>(
                            builder: (_) {
                              return ListView.separated(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                itemCount: controller.categories.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int index) {
                                  CategoryModel category = controller.categories[index];
                                  return InkWell(
                                    onTap: () {
                                      for (CategoryModel category in controller.categories) {
                                        category.isSelected = false;
                                      }
                                      controller.categories[index].isSelected = true;
                                      controller.update();
                                    },
                                    child: HomeCategoryWidget(category),
                                  );
                                },
                                separatorBuilder: (BuildContext context, int index) {
                                  return 15.gap;
                                },
                              );
                            },
                          ),
                        ),
                        GetBuilder<HomeController>(
                          builder: (_) {
                            return controller.mushroomList.isEmpty
                                ? Padding(padding: 15.edgeInsetsVertical, child: Align(alignment: Alignment.bottomCenter, child: 30.darkLoading))
                                : controller.mushroomList
                                    .where(
                                      (plant) =>
                                          controller.categories.firstWhere((category) => category.isSelected).title == AppStrings.allText
                                              ? true
                                              : plant.category == controller.categories.firstWhere((category) => category.isSelected).title,
                                    )
                                    .isEmpty
                                ? Padding(
                                  padding: 15.edgeInsetsVertical,
                                  child: Text(AppStrings.noItemsFoundText, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.greenColor, fontWeight: FontWeight.bold)),
                                )
                                : MasonryGridView.builder(
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount:
                                      controller.categories.firstWhere((category) => category.isSelected == true).title == AppStrings.allText
                                          ? controller.mushroomList.where((plant) => plant.title.toLowerCase().contains(controller.searchController.text.toLowerCase())).length
                                          : controller.mushroomList
                                              .where((plant) => plant.title.toLowerCase().contains(controller.searchController.text.toLowerCase()))
                                              .where((plant) => plant.category == controller.categories.firstWhere((category) => category.isSelected == true).title)
                                              .length,
                                  gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                  itemBuilder: (itemBuilder, index) {
                                    List<MushroomModel> mushroomList =
                                        controller.categories.firstWhere((category) => category.isSelected == true).title == AppStrings.allText
                                            ? controller.mushroomList.where((plant) => plant.title.toLowerCase().contains(controller.searchController.text.toLowerCase())).toList()
                                            : controller.mushroomList
                                                .where((plant) => plant.title.toLowerCase().contains(controller.searchController.text.toLowerCase()))
                                                .where((plant) => plant.category == controller.categories.firstWhere((category) => category.isSelected == true).title)
                                                .toList();
                                    MushroomModel mushroom = mushroomList[index];
                                    return InkWell(
                                      onTap: () {
                                        Get.toNamed(AppStrings.detailsRoute, arguments: mushroom);
                                      },
                                      child: HomeLibraryPlantWidget(mushroom),
                                    );
                                  },
                                );
                          },
                        ),
                        25.gap,
                      ],
                    )
                    : Column(children: [Text("data")]);
              },
            ),
          ),
        ),
      ),
    );
  }
}

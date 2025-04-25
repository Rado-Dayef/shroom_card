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
                        CircleAvatar(radius: 20, backgroundColor: AppColors.lightGreyColor, foregroundColor: AppColors.greyColor, child: Image.asset(AppStrings.logoImage)),
                        5.gap,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(AppStrings.welcomeToText, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.secLightGreyColor, fontSize: 18)),
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
                                border: Border.all(color: controller.isBrowse ? AppColors.greyColor : AppColors.secLightGreyColor),
                                color: controller.isBrowse ? AppColors.lightGreyColor : AppColors.whiteColor,
                              ),
                              alignment: Alignment.center,
                              padding: 10.edgeInsetsAll,
                              child: Text(AppStrings.browseText, style: TextStyle(color: controller.isBrowse ? AppColors.greyColor : AppColors.secLightGreyColor)),
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
                                border: Border.all(color: !controller.isBrowse ? AppColors.greyColor : AppColors.secLightGreyColor),
                                color: !controller.isBrowse ? AppColors.lightGreyColor : AppColors.whiteColor,
                              ),
                              alignment: Alignment.center,
                              padding: 10.edgeInsetsAll,
                              child: Text(AppStrings.identifyText, style: TextStyle(color: !controller.isBrowse ? AppColors.greyColor : AppColors.secLightGreyColor)),
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
                              fillColor: AppColors.lightGreyColor,
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
                                      controller.getCurrentMushroomList();
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
                                ? Padding(
                                  padding: 15.edgeInsetsVertical,
                                  child: Text(AppStrings.noItemsFoundText, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.greyColor, fontWeight: FontWeight.bold)),
                                )
                                : MasonryGridView.builder(
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: controller.mushroomList.where((plant) => plant.title.toLowerCase().contains(controller.searchController.text.toLowerCase())).length,
                                  gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                  itemBuilder: (itemBuilder, index) {
                                    List<MushroomModel> mushroomList =
                                        controller.mushroomList.where((plant) => plant.title.toLowerCase().contains(controller.searchController.text.toLowerCase())).toList();
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
                    : Column(
                      children: [
                        Row(children: [15.gap, Text(AppStrings.identifyText, style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold))]),
                        10.gap,
                        InkWell(
                          onTap: () => controller.pickImage(),
                          child: GetBuilder<HomeController>(
                            builder: (_) {
                              return Container(
                                width: 300,
                                height: 300,
                                decoration: BoxDecoration(
                                  color: AppColors.lightGreyColor,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(color: AppColors.greyColor),
                                  image: controller.selectedImage != null ? DecorationImage(image: FileImage(controller.selectedImage!), fit: BoxFit.cover) : null,
                                ),
                                child: controller.selectedImage == null ? Icon(Icons.image, size: 100, color: AppColors.greyColor) : null,
                              );
                            },
                          ),
                        ),
                        20.gap,
                        GetBuilder<HomeController>(
                          builder: (_) {
                            return controller.selectedImage != null
                                ? Column(
                                    children: [
                                      ElevatedButton(
                                        onPressed: controller.isIdentifying ? null : () => controller.identifyMushroom(),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: AppColors.greyColor,
                                          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                        ),
                                        child: controller.isIdentifying
                                            ? SizedBox(height: 20, width: 20, child: CircularProgressIndicator(color: AppColors.whiteColor, strokeWidth: 2))
                                            : Text('Identify Mushroom', style: TextStyle(color: AppColors.whiteColor)),
                                      ),
                                      20.gap,
                                      if (controller.identificationResult != null && !controller.identificationResult!.containsKey('error'))
                                        Container(
                                          width: double.infinity,
                                          margin: EdgeInsets.symmetric(horizontal: 15),
                                          padding: EdgeInsets.all(15),
                                          decoration: BoxDecoration(
                                            color: AppColors.lightGreyColor,
                                            borderRadius: BorderRadius.circular(10),
                                            border: Border.all(color: AppColors.greyColor),
                                          ),
                                          child: Column(
                                            crossAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('Identification Results:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                                              10.gap,
                                              Text('Mushroom Type: ${controller.getIdentifiedMushroomLabel() ?? "Unknown"}', 
                                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                                              15.gap,
                                              Text('Confidence Levels:', style: TextStyle(fontWeight: FontWeight.bold)),
                                              10.gap,
                                              if (controller.getConfidenceList() != null)
                                                ...controller.getConfidenceList()!.map((confidence) => Padding(
                                                  padding: EdgeInsets.only(bottom: 5),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text(confidence['label'] ?? 'Unknown'),
                                                      Text('${(confidence['confidence'] * 100).toStringAsFixed(1)}%'),
                                                    ],
                                                  ),
                                                )).toList(),
                                            ],
                                          ),
                                        ),
                                    ],
                                  )
                                : SizedBox();
                          },
                        ),
                        30.gap,
                      ],
                    );
              },
            ),
          ),
        ),
      ),
    );
  }
}

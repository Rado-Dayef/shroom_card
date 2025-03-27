import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shroom_card/constants/colors.dart';
import 'package:shroom_card/constants/extensions.dart';
import 'package:shroom_card/constants/strings.dart';
import 'package:shroom_card/models/mushroom_model.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MushroomModel mushroomFromArguments = Get.arguments;
    return Scaffold(
      backgroundColor: AppColors.lightGreenColor,
      body: SafeArea(
        child: CustomScrollView(
          physics: const NeverScrollableScrollPhysics(),
          slivers: [
            SliverAppBar.large(
              backgroundColor: AppColors.transparentColor,
              floating: false,
              pinned: false,
              elevation: 0,
              expandedHeight: MediaQuery.of(context).size.height * 0.59,
              leading: Container(),
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Center(
                      child: Hero(
                        tag: mushroomFromArguments.image,
                        child: ClipRRect(
                          borderRadius: 15.borderRadiusAll,
                          child: Image.asset(mushroomFromArguments.image, width: double.infinity, height: MediaQuery.of(context).size.height * 0.6, fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(onTap: Get.back, child: CircleAvatar(backgroundColor: AppColors.secLightGreenColor, child: Icon(Icons.arrow_back_ios_new, color: AppColors.whiteColor, size: 20))),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  padding: EdgeInsets.only(right: 20, bottom: 10, left: 20),
                  decoration: BoxDecoration(color: AppColors.whiteColor, borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          mushroomFromArguments.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        15.gap,
                        Text(AppStrings.categoryText, style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold)),
                        5.gap,
                        Text(mushroomFromArguments.category, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.secLightGreenColor, fontSize: 18)),
                        15.gap,
                        Text(AppStrings.categoryText, style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold)),
                        5.gap,
                        Text(mushroomFromArguments.edible, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.secLightGreenColor, fontSize: 18)),
                        15.gap,
                        Text(AppStrings.aboutPlantText, style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold)),
                        5.gap,
                        Text(mushroomFromArguments.description, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.secLightGreenColor, fontSize: 18)),
                        25.gap,
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

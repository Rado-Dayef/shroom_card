import 'package:flutter/material.dart';
import 'package:shroom_card/constants/colors.dart';
import 'package:shroom_card/models/category_model.dart';

class HomeCategoryWidget extends StatelessWidget {
  final CategoryModel category;

  const HomeCategoryWidget(this.category, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: category.isSelected ? AppColors.greyColor : AppColors.secLightGreyColor),
        color: category.isSelected ? AppColors.lightGreyColor : AppColors.whiteColor,
      ),
      child: Text(
        category.title,
        style: Theme.of(
          context,
        ).textTheme.bodyMedium?.copyWith(color: category.isSelected ? AppColors.greyColor : AppColors.secLightGreyColor, fontSize: 18, fontWeight: category.isSelected ? FontWeight.bold : null),
      ),
    );
  }
}

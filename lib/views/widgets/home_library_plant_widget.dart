import 'package:flutter/material.dart';
import 'package:shroom_card/constants/colors.dart';
import 'package:shroom_card/constants/extensions.dart';
import 'package:shroom_card/models/mushroom_model.dart';

class HomeLibraryPlantWidget extends StatelessWidget {
  final MushroomModel mushroom;

  const HomeLibraryPlantWidget(this.mushroom, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10, bottom: 5),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.lightGreyColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [BoxShadow(color: AppColors.secLightGreyColor, offset: const Offset(0, 0), blurRadius: 8, spreadRadius: 1)],
        ),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(padding: 10.edgeInsetsHorizontal, child: Center(child: Hero(tag: mushroom.image, child: ClipRRect(borderRadius: 15.borderRadiusAll, child: Image.network(mushroom.image))))),
                5.gap,
                Padding(padding: EdgeInsets.symmetric(horizontal: 10), child: Text(mushroom.title, style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold))),
                5.gap,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                        child: Text(mushroom.category, style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold, color: AppColors.secLightGreyColor)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

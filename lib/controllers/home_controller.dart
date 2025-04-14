import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shroom_card/constants/strings.dart';
import 'package:shroom_card/models/category_model.dart';
import 'package:shroom_card/models/mushroom_model.dart';

class HomeController extends GetxController {
  File? selectedImage;
  bool isBrowse = true;
  List<MushroomModel> mushroomList = [];
  List<MushroomModel> allMushroomList = Get.arguments;
  TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    getCurrentMushroomList();
    super.onInit();
  }

  Future<void> pickImage() async {
    try {
      final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        selectedImage = File(pickedFile.path);
        update();
      } else {
        print('No image selected.');
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  List<CategoryModel> categories = [
    CategoryModel(AppStrings.allText, isSelected: true),
    CategoryModel(AppStrings.poisonousText, isSelected: false),
    CategoryModel(AppStrings.nonPoisonousText, isSelected: false),
    CategoryModel(AppStrings.edibleText, isSelected: false),
    CategoryModel(AppStrings.nonEdibleText, isSelected: false),
  ];

  void getCurrentMushroomList() {
    String selectedCategory = categories.firstWhere((element) => element.isSelected).title;
    if (selectedCategory == AppStrings.poisonousText) {
      mushroomList = allMushroomList.where((element) => element.category == AppStrings.poisonousText).toList();
    } else if (selectedCategory == AppStrings.nonPoisonousText) {
      mushroomList = allMushroomList.where((element) => element.category == AppStrings.nonPoisonousText).toList();
    } else if (selectedCategory == AppStrings.edibleText) {
      mushroomList = allMushroomList.where((element) => element.category == AppStrings.poisonousText).toList();
    } else if (selectedCategory == AppStrings.nonEdibleText) {
      mushroomList = allMushroomList.where((element) => element.category == AppStrings.nonPoisonousText).toList();
    } else {
      mushroomList = allMushroomList;
    }
    update();
  }
}

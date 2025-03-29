import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shroom_card/constants/strings.dart';
import 'package:shroom_card/models/category_model.dart';
import 'package:shroom_card/models/mushroom_model.dart';

class HomeController extends GetxController {
  TextEditingController searchController = TextEditingController();
  File? selectedImage;
  List<MushroomModel> mushroomList = [];

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

  bool isBrowse = true;
  List<CategoryModel> categories = [
    CategoryModel(AppStrings.allText, isSelected: true),
    CategoryModel(AppStrings.poisonousText, isSelected: false),
    CategoryModel(AppStrings.nonPoisonousText, isSelected: false),
    CategoryModel(AppStrings.edibleText, isSelected: false),
    CategoryModel(AppStrings.nonEdibleText, isSelected: false),
  ];

  List<MushroomModel> allMushroomList = [
    MushroomModel(
      AppStrings.m1TitleText,
      edible: AppStrings.m1EdibleText,
      medicalUses: AppStrings.m1MedicalUsesText,
      description: AppStrings.m1DescriptionText,
      category: AppStrings.poisonousText,
      image: AppStrings.m1Image,
    ),
    MushroomModel(
      AppStrings.m2TitleText,
      edible: AppStrings.m2EdibleText,
      medicalUses: AppStrings.m2MedicalUsesText,
      description: AppStrings.m2DescriptionText,
      category: AppStrings.poisonousText,
      image: AppStrings.m2Image,
    ),
    MushroomModel(
      AppStrings.m3TitleText,
      edible: AppStrings.m3EdibleText,
      medicalUses: AppStrings.m3MedicalUsesText,
      description: AppStrings.m3DescriptionText,
      category: AppStrings.poisonousText,
      image: AppStrings.m3Image,
    ),
    MushroomModel(
      AppStrings.m4TitleText,
      edible: AppStrings.m4EdibleText,
      medicalUses: AppStrings.m4MedicalUsesText,
      description: AppStrings.m4DescriptionText,
      category: AppStrings.poisonousText,
      image: AppStrings.m4Image,
    ),
    MushroomModel(
      AppStrings.m5TitleText,
      edible: AppStrings.m5EdibleText,
      medicalUses: AppStrings.m5MedicalUsesText,
      description: AppStrings.m5DescriptionText,
      category: AppStrings.nonPoisonousText,
      image: AppStrings.m5Image,
    ),
    MushroomModel(
      AppStrings.m6TitleText,
      edible: AppStrings.m6EdibleText,
      medicalUses: AppStrings.m6MedicalUsesText,
      description: AppStrings.m6DescriptionText,
      category: AppStrings.nonPoisonousText,
      image: AppStrings.m6Image,
    ),
    MushroomModel(
      AppStrings.m7TitleText,
      edible: AppStrings.m7EdibleText,
      medicalUses: AppStrings.m7MedicalUsesText,
      description: AppStrings.m7DescriptionText,
      category: AppStrings.nonPoisonousText,
      image: AppStrings.m7Image,
    ),
    MushroomModel(
      AppStrings.m8TitleText,
      edible: AppStrings.m8EdibleText,
      medicalUses: AppStrings.m8MedicalUsesText,
      description: AppStrings.m8DescriptionText,
      category: AppStrings.nonPoisonousText,
      image: AppStrings.m8Image,
    ),
    MushroomModel(
      AppStrings.m9TitleText,
      edible: AppStrings.m9EdibleText,
      medicalUses: AppStrings.m9MedicalUsesText,
      description: AppStrings.m9DescriptionText,
      category: AppStrings.nonPoisonousText,
      image: AppStrings.m9Image,
    ),
  ];

  List<MushroomModel> poisonousMushroomList = [
    MushroomModel(
      AppStrings.m1TitleText,
      edible: AppStrings.m1EdibleText,
      medicalUses: AppStrings.m1MedicalUsesText,
      description: AppStrings.m1DescriptionText,
      category: AppStrings.poisonousText,
      image: AppStrings.m1Image,
    ),
    MushroomModel(
      AppStrings.m2TitleText,
      edible: AppStrings.m2EdibleText,
      medicalUses: AppStrings.m2MedicalUsesText,
      description: AppStrings.m2DescriptionText,
      category: AppStrings.poisonousText,
      image: AppStrings.m2Image,
    ),
    MushroomModel(
      AppStrings.m3TitleText,
      edible: AppStrings.m3EdibleText,
      medicalUses: AppStrings.m3MedicalUsesText,
      description: AppStrings.m3DescriptionText,
      category: AppStrings.poisonousText,
      image: AppStrings.m3Image,
    ),
    MushroomModel(
      AppStrings.m4TitleText,
      edible: AppStrings.m4EdibleText,
      medicalUses: AppStrings.m4MedicalUsesText,
      description: AppStrings.m4DescriptionText,
      category: AppStrings.poisonousText,
      image: AppStrings.m4Image,
    ),
  ];

  List<MushroomModel> nonPoisonousMushroomList = [
    MushroomModel(
      AppStrings.m5TitleText,
      edible: AppStrings.m5EdibleText,
      medicalUses: AppStrings.m5MedicalUsesText,
      description: AppStrings.m5DescriptionText,
      category: AppStrings.nonPoisonousText,
      image: AppStrings.m5Image,
    ),
    MushroomModel(
      AppStrings.m6TitleText,
      edible: AppStrings.m6EdibleText,
      medicalUses: AppStrings.m6MedicalUsesText,
      description: AppStrings.m6DescriptionText,
      category: AppStrings.nonPoisonousText,
      image: AppStrings.m6Image,
    ),
    MushroomModel(
      AppStrings.m7TitleText,
      edible: AppStrings.m7EdibleText,
      medicalUses: AppStrings.m7MedicalUsesText,
      description: AppStrings.m7DescriptionText,
      category: AppStrings.nonPoisonousText,
      image: AppStrings.m7Image,
    ),
    MushroomModel(
      AppStrings.m8TitleText,
      edible: AppStrings.m8EdibleText,
      medicalUses: AppStrings.m8MedicalUsesText,
      description: AppStrings.m8DescriptionText,
      category: AppStrings.nonPoisonousText,
      image: AppStrings.m8Image,
    ),
    MushroomModel(
      AppStrings.m9TitleText,
      edible: AppStrings.m9EdibleText,
      medicalUses: AppStrings.m9MedicalUsesText,
      description: AppStrings.m9DescriptionText,
      category: AppStrings.nonPoisonousText,
      image: AppStrings.m9Image,
    ),
  ];

  List<MushroomModel> edibleMushroomList = [
    MushroomModel(
      AppStrings.m5TitleText,
      edible: AppStrings.m5EdibleText,
      medicalUses: AppStrings.m5MedicalUsesText,
      description: AppStrings.m5DescriptionText,
      category: AppStrings.nonPoisonousText,
      image: AppStrings.m5Image,
    ),
    MushroomModel(
      AppStrings.m6TitleText,
      edible: AppStrings.m6EdibleText,
      medicalUses: AppStrings.m6MedicalUsesText,
      description: AppStrings.m6DescriptionText,
      category: AppStrings.nonPoisonousText,
      image: AppStrings.m6Image,
    ),
    MushroomModel(
      AppStrings.m7TitleText,
      edible: AppStrings.m7EdibleText,
      medicalUses: AppStrings.m7MedicalUsesText,
      description: AppStrings.m7DescriptionText,
      category: AppStrings.nonPoisonousText,
      image: AppStrings.m7Image,
    ),
    MushroomModel(
      AppStrings.m8TitleText,
      edible: AppStrings.m8EdibleText,
      medicalUses: AppStrings.m8MedicalUsesText,
      description: AppStrings.m8DescriptionText,
      category: AppStrings.nonPoisonousText,
      image: AppStrings.m8Image,
    ),
    MushroomModel(
      AppStrings.m9TitleText,
      edible: AppStrings.m9EdibleText,
      medicalUses: AppStrings.m9MedicalUsesText,
      description: AppStrings.m9DescriptionText,
      category: AppStrings.nonPoisonousText,
      image: AppStrings.m9Image,
    ),
  ];

  List<MushroomModel> nonEdibleMushroomList = [
    MushroomModel(
      AppStrings.m1TitleText,
      edible: AppStrings.m1EdibleText,
      medicalUses: AppStrings.m1MedicalUsesText,
      description: AppStrings.m1DescriptionText,
      category: AppStrings.poisonousText,
      image: AppStrings.m1Image,
    ),
    MushroomModel(
      AppStrings.m2TitleText,
      edible: AppStrings.m2EdibleText,
      medicalUses: AppStrings.m2MedicalUsesText,
      description: AppStrings.m2DescriptionText,
      category: AppStrings.poisonousText,
      image: AppStrings.m2Image,
    ),
    MushroomModel(
      AppStrings.m3TitleText,
      edible: AppStrings.m3EdibleText,
      medicalUses: AppStrings.m3MedicalUsesText,
      description: AppStrings.m3DescriptionText,
      category: AppStrings.poisonousText,
      image: AppStrings.m3Image,
    ),
    MushroomModel(
      AppStrings.m4TitleText,
      edible: AppStrings.m4EdibleText,
      medicalUses: AppStrings.m4MedicalUsesText,
      description: AppStrings.m4DescriptionText,
      category: AppStrings.poisonousText,
      image: AppStrings.m4Image,
    ),
  ];

  void getCurrentMushroomList() {
    String selectedCategory = categories.firstWhere((element) => element.isSelected).title;
    if (selectedCategory == AppStrings.poisonousText) {
      mushroomList = poisonousMushroomList;
    } else if (selectedCategory == AppStrings.nonPoisonousText) {
      mushroomList = nonPoisonousMushroomList;
    } else if (selectedCategory == AppStrings.edibleText) {
      mushroomList = edibleMushroomList;
    } else if (selectedCategory == AppStrings.nonEdibleText) {
      mushroomList = nonEdibleMushroomList;
    } else {
      mushroomList = allMushroomList;
    }
    update();
  }
}

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shroom_card/constants/colors.dart';
import 'package:shroom_card/constants/strings.dart';
import 'package:shroom_card/models/category_model.dart';
import 'package:shroom_card/models/mushroom_model.dart';
import 'package:shroom_card/services/mushroom_api_service.dart';

class HomeController extends GetxController {
  File? selectedImage;
  bool isBrowse = true;
  bool isIdentifying = false;
  Map<String, dynamic>? identificationResult;
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
        // Reset previous identification results
        identificationResult = null;
        update();
      } else {
        print('No image selected.');
      }
    } catch (e) {
      print('Error picking image: $e');
      Fluttertoast.showToast(
        msg: 'Error picking image: $e',
        backgroundColor: AppColors.greyColor,
        textColor: AppColors.whiteColor,
      );
    }
  }
  
  Future<void> identifyMushroom() async {
    if (selectedImage == null) {
      Fluttertoast.showToast(
        msg: 'Please select an image first',
        backgroundColor: AppColors.greyColor,
        textColor: AppColors.whiteColor,
      );
      return;
    }
    
    try {
      isIdentifying = true;
      update();
      
      // Call the API service to identify the mushroom
      final result = await MushroomApiService.identifyMushroom(selectedImage!);
      
      isIdentifying = false;
      identificationResult = result;
      update();
      
      if (result.containsKey('error') && result['error'] == true) {
        Fluttertoast.showToast(
          msg: result['message'] ?? 'Failed to identify mushroom',
          backgroundColor: AppColors.greyColor,
          textColor: AppColors.whiteColor,
          toastLength: Toast.LENGTH_LONG,
        );
      }
    } catch (e) {
      isIdentifying = false;
      update();
      
      Fluttertoast.showToast(
        msg: 'Error identifying mushroom: $e',
        backgroundColor: AppColors.greyColor,
        textColor: AppColors.whiteColor,
        toastLength: Toast.LENGTH_LONG,
      );
      print('Error identifying mushroom: $e');
    }
  }
  
  // Get the identified mushroom label
  String? getIdentifiedMushroomLabel() {
    if (identificationResult != null && !identificationResult!.containsKey('error')) {
      return identificationResult!['label'];
    }
    return null;
  }
  
  // Get confidence level for the identification
  List<Map<String, dynamic>>? getConfidenceList() {
    if (identificationResult != null && 
        !identificationResult!.containsKey('error') && 
        identificationResult!.containsKey('confidences')) {
      return List<Map<String, dynamic>>.from(identificationResult!['confidences']);
    }
    return null;
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

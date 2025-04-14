import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shroom_card/constants/extensions.dart';
import 'package:shroom_card/constants/strings.dart';
import 'package:shroom_card/models/mushroom_model.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    fetchMushrooms().then((mushrooms) {
      Future.delayed(5.sec, () => Get.offNamed(AppStrings.homeRoute, arguments: mushrooms));
    });
    super.onInit();
  }

  Future<List<MushroomModel>> fetchMushrooms() async {
    final CollectionReference mushroomsRef = FirebaseFirestore.instance.collection('mushrooms');

    try {
      final snapshot = await mushroomsRef.get();

      return snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return MushroomModel.fromMap(data);
      }).toList();
    } catch (e) {
      e.toString().showToast;
      return [];
    }
  }
}

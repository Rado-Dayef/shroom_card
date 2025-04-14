class MushroomModel {
  final String image;
  final String title;
  final String edible;
  final String category;
  final String description;
  final String medicalUses;

  MushroomModel(this.title, {required this.image, required this.edible, required this.category, required this.description, required this.medicalUses});

  factory MushroomModel.fromMap(Map<String, dynamic> map) {
    return MushroomModel(
      map["title"],
      image: map["image"],
      edible: map["edible"],
      category: map["category"],
      medicalUses: map["medicalUses"],
      description: map["description"],
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  final String id;
  final String name;
  final String image;

  CategoryModel({required this.id, required this.name, required this.image});

  static CategoryModel empty() => CategoryModel(id: " ", name: " ", image: " ");

  // Convert model to jSon structure to store in firestore
  Map<String, dynamic> toJson() {
    return {'id': id, 'Name': name, 'ImageUrl': image};
  }

  // Factory method to create a CategoryModel from a firestore document method.
  factory CategoryModel.fromJson(DocumentSnapshot<Map<String, dynamic>> json) {
    if (json.data() != null) {
      final data = json.data()!;

      return CategoryModel(
        id: data['id'] ?? " ",
        name: data['Name'] ?? " ",
        image: data['ImageUrl'] ?? " ",
      );
    } else {
      return CategoryModel.empty();
    }
  }
}

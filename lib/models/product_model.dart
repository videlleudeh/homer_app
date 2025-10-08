import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  final String id;
  final String name;
  final String imageUrl;
  final String thumbnail;
  final double price;
  final double salesPrice;
  final String description;
  final String categoryId;
  final bool isSales;

  ProductModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.thumbnail,
    required this.price,
    required this.salesPrice,
    required this.description,
    required this.categoryId,
    this.isSales = true,
  });

  static ProductModel empty() => ProductModel(
    id: " ",
    name: " ",
    imageUrl: " ",
    thumbnail: " ",
    price: 0.0,
    salesPrice: 0.0,
    description: " ",
    categoryId: " ",
  );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'Name': name,
      'Image': imageUrl,
      'Thumbnail': thumbnail,
      'Price': price,
      'SalesPrice': salesPrice,
      'Description': description,
      'CategoryID': categoryId,
      'isSales': isSales,
    };
  }

  factory ProductModel.fromJson(DocumentSnapshot<Map<String, dynamic>> json) {
    if (json.data() != null) {
      final data = json.data()!;
      return ProductModel(
        id: json.id,
        name: data["Name"] ?? " ",
        imageUrl: data["Image"] ?? " ",
        thumbnail: data["Thumbnail"] ?? " ",
        price: double.parse((data["Price"] ?? 0).toString()),
        salesPrice: double.parse((data["SalesPrice"] ?? 0).toString()),
        description: data["Description"] ?? " ",
        categoryId: data["CategoryID"] ?? " ",
      );
    } else {
      return ProductModel.empty();
    }
  }
}

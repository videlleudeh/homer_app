import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';

part 'product_model.g.dart';

@HiveType(typeId: 1)
class ProductModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String imageUrl;

  @HiveField(3)
  final String thumbnail;

  @HiveField(4)
  final double price;

  @HiveField(5)
  final double salesPrice;

  @HiveField(6)
  final String description;

  @HiveField(7)
  final String categoryId;

  @HiveField(8, defaultValue: true)
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

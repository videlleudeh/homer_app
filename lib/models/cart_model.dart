import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';

part 'cart_model.g.dart';

@HiveType(typeId: 0)
class CartModel extends HiveObject {
  @HiveField(0)
  final String uid;

  @HiveField(1)
  final String productImage;

  @HiveField(2)
  final String productName;

  @HiveField(3, defaultValue: Color.fromARGB(202, 199, 11, 11))
  final Color? color;

  @HiveField(4, defaultValue: 1)
  int quantity;

  @HiveField(5)
  final double productPrice;

  CartModel({
    required this.uid,
    required this.productImage,
    required this.productName,
    this.color,
    this.quantity = 1,
    required this.productPrice,
  });

  double get totalPrice => quantity * productPrice;

  static CartModel empty() => CartModel(
    uid: " ",
    productImage: " ",
    productName: " ",
    color: Color.fromARGB(202, 199, 11, 11),
    quantity: 0,
    productPrice: 0,
  );

  Map<String, dynamic> toJson() {
    return {
      'id': uid,
      'Name': productName,
      'ImageUrl': productImage,
      'Color': color,
      'Price': productPrice,
      'Quantity': quantity,
    };
  }

  factory CartModel.fromJson(DocumentSnapshot<Map<String, dynamic>> json) {
    if (json.data() != null) {
      final data = json.data()!;
      return CartModel(
        uid: data['uid'] ?? " ",
        productImage: data['productImage'] ?? " ",
        productName: data['productName'] ?? " ",
        color: data['color'] ?? " ",
        productPrice: double.parse((data['productPrice'] ?? 0).toString()),
      );
    } else {
      return CartModel.empty();
    }
  }

  CartModel copyWith({int? quantity}) {
    return CartModel(
      uid: uid,
      productImage: productImage,
      productName: productName,
      productPrice: productPrice,
      quantity: quantity ?? this.quantity,
    );
  }
}

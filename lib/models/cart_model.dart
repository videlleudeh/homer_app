import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

class CartModel {
  final String uid;
  final String productImage;
  final String productName;
  final Color? color;
  int quantity;
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

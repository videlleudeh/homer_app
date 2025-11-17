import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:homer_app/models/cart_model.dart';
// import 'package:flutter/widgets.dart';

class OrderModel {
  final String uid;
  final String userID;
  final List<CartModel> items;
  final String status;
  final double total;
  OrderModel({
    required this.uid,
    required this.userID,
    required this.items,
    this.status = "pending",
    required this.total,
  });

  static OrderModel empty() =>
      OrderModel(uid: " ", userID: " ", items: [], status: " ", total: 0);

  Map<String, dynamic> toJson() {
    return {
      'userID': userID,
      'OrderItems': items.map((e) => e.toJson()).toList(),
      'OrderStatus': status,
      'OrderTotal': total,
    };
  }

  factory OrderModel.fromJson(
    DocumentSnapshot<Map<String, dynamic>> json,
    String uid,
  ) {
    if (json.data() != null) {
      final data = json.data()!;
      return OrderModel(
        uid: uid,
        userID: data['userID'] ?? " ",
        items: data['OrderItems'] ?? " ",
        status: data['OrderStatus'] ?? " ",
        total: double.parse((data['OrderTotal'] ?? 0).toString()),
      );
    } else {
      return OrderModel.empty();
    }
  }
}

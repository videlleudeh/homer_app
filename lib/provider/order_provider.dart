import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:homer_app/models/cart_model.dart';
import 'package:homer_app/models/order_model.dart';

class OrderNotifier extends StateNotifier<List<OrderModel>> {
  OrderNotifier() : super([]);

  Future<void> placeOrder(String userID, List<CartModel> cartItems) async {
    try {
      final total = cartItems.fold(
        0.0,
        (sums, items) => sums + items.productPrice * items.quantity,
      );
      final newOrder = OrderModel(
        uid: FirebaseFirestore.instance.collection("Users").doc().id,
        userID: userID,
        items: cartItems,
        total: total,
      );
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(userID)
          .collection("Orders")
          .doc(newOrder.uid)
          .set(newOrder.toJson());
    } on FirebaseException catch (e) {
      throw 'Failed to place order: ${e.message}';
    } catch (e) {
      throw 'Failed to place order. Please try again.';
    }
  }
}

final orderProvider = StateNotifierProvider<OrderNotifier, List<OrderModel>>((
  ref,
) {
  return OrderNotifier();
});

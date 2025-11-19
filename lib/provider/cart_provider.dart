import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:homer_app/models/cart_model.dart';

class CartNotifier extends StateNotifier<List<CartModel>> {
  Box<CartModel> cartBox;
  CartNotifier(this.cartBox) : super(cartBox.values.toList());

  // Add item to cart
  bool addToCart(CartModel item) {
    final isExisting = cartBox.containsKey(item.uid);

    if (isExisting) {
      final cartItem = cartBox.get(item.uid)!;
      cartItem.quantity++;
      cartItem.save();
      state = cartBox.values.toList();
      return false;
    } else {
      cartBox.put(item.uid, item);
      state = cartBox.values.toList();
      return true;
    }
  }

  //  remove item from cart
  bool deleteItem(String uid) {
    cartBox.delete(uid);
    state = cartBox.values.toList();
    return true;
  }

  // undo delete
  // void undoDelete(String uid) {}

  //  increase quantity
  void increaseQ(String uid) {
    final cartItem = cartBox.get(uid);
    if (cartItem != null) {
      cartItem.quantity++;
      cartItem.save();
      state = cartBox.values.toList();
    }
  }

  // decrease quantity
  void decreaseQ(String uid) {
    final cartItem = cartBox.get(uid);
    if (cartItem != null) {
      if (cartItem.quantity > 1) {
        cartItem.quantity--;
        cartItem.save();
      } else {
        cartBox.delete(uid);
      }
      state = cartBox.values.toList();
    }
  }

  void clearCart() {
    cartBox.clear();
    state = [];
  }
}

final cartProvider = StateNotifierProvider<CartNotifier, List<CartModel>>((
  ref,
) {
  final cartbox = Hive.box<CartModel>('cartBox');
  return CartNotifier(cartbox);
});

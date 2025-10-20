import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:homer_app/models/cart_model.dart';

class CartNotifier extends StateNotifier<List<CartModel>> {
  CartNotifier() : super([]);

  // Add item to cart
  bool addToCart(CartModel item) {
    final idItem = state.indexWhere(
      (selectedItem) => selectedItem.uid == item.uid,
    );

    if (idItem != -1) {
      final updatedList = [...state];
      updatedList[idItem].quantity++;
      state = updatedList;
      return true;
    } else {
      state = [...state, item];
      return false;
    }
  }

  //  remove item from cart
  bool deleteItem(String uid) {
    state = state.where((item) => item.uid != uid).toList();
    return true;
  }

  // undo delete
  void undoDelete(String uid) {}

  //  increase quantity
  void increaseQ(String uid) {
    final idItem = state.indexWhere((selectedItem) => selectedItem.uid == uid);
    if (idItem != -1) {
      final updatedItem = state[idItem].copyWith(
        quantity: state[idItem].quantity + 1,
      );
      final newList = [...state];
      newList[idItem] = updatedItem;
      state = newList;
    }
  }

  // decrease quantity
  void decreaseQ(String uid) {
    final idItem = state.indexWhere((selectedItem) => selectedItem.uid == uid);
    if (idItem != -1) {
      if (state[idItem].quantity > 1) {
        final updatedItem = state[idItem].copyWith(
          quantity: state[idItem].quantity - 1,
        );
        final newList = [...state];
        newList[idItem] = updatedItem;
        state = newList;
      } else {
        deleteItem(uid);
      }
    }
  }
}

final cartProvider = StateNotifierProvider<CartNotifier, List<CartModel>>((
  ref,
) {
  return CartNotifier();
});

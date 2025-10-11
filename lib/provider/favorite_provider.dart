import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:homer_app/models/product_model.dart';

class FavoriteNotifier extends StateNotifier<List<ProductModel>> {
  FavoriteNotifier() : super([]);

  bool onClickFavorite(ProductModel product) {
    final isFavorite = state.any((item) => item.id == product.id);

    if (isFavorite) {
      state = state.where((item) => item.id != product.id).toList();
      return false;
    } else {
      state = [...state, product];
      return true;
    }
  }
}

final favoriteProvider =
    StateNotifierProvider<FavoriteNotifier, List<ProductModel>>((ref) {
      return FavoriteNotifier();
    });

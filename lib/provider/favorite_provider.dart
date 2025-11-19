import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:homer_app/models/product_model.dart';

class FavoriteNotifier extends StateNotifier<List<ProductModel>> {
  late Box<ProductModel> favoriteBox;
  FavoriteNotifier() : super([]) {
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    favoriteBox = await Hive.openBox<ProductModel>('favoriteBox');
    state = favoriteBox.values.toList();
  }

  bool onClickFavorite(ProductModel product) {
    final isFavorite = favoriteBox.containsKey(product.id);

    if (isFavorite) {
      favoriteBox.delete(product.id);
      state = favoriteBox.values.toList();
      return false;
    } else {
      favoriteBox.put(product.id, product);
      state = favoriteBox.values.toList();
      return true;
    }
  }

  bool isFav(ProductModel product) {
    return state.any((item) => item.id == product.id);
  }
}

final favoriteProvider =
    StateNotifierProvider<FavoriteNotifier, List<ProductModel>>((ref) {
      return FavoriteNotifier();
    });

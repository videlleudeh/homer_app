import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:homer_app/models/product_model.dart';
import 'package:homer_app/repository/product_repository.dart';

final productRepositoryProvider = Provider((ref) => ProductRepository());

final productProvider = FutureProvider<List<ProductModel>>((ref) {
  final productRepo = ref.watch(productRepositoryProvider);
  return productRepo.getAllProducts();
});

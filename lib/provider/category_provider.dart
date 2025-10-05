import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:homer_app/models/category.dart';
import 'package:homer_app/repository/category_repository.dart';

final categoryRepositoryProvider = Provider((ref) => CategoryRepository());

final categoriesProvider = FutureProvider<List<CategoryModel>>((ref) {
  final categoryRepo = ref.watch(categoryRepositoryProvider);
  return categoryRepo.getCategories();
});

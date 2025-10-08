import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:homer_app/models/category.dart';

class CategoryRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  CategoryRepository();

  Future<List<CategoryModel>> getCategories() async {
    try {
      final documentSnapshot = await _firestore.collection("Categories").get();
      final categotyList = documentSnapshot.docs
          .map((document) => CategoryModel.fromJson(document))
          .toList();
      return categotyList;
    } on FirebaseException catch (e) {
      throw 'Failed to get category data: ${e.message}';
    } catch (e) {
      throw 'Failed to get category data. Please try again';
    }
  }
}

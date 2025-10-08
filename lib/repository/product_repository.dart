import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:homer_app/models/product_model.dart';

class ProductRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  ProductRepository();

  Future<List<ProductModel>> getAllProducts() async {
    try {
      final documentSnapshot = await _firestore.collection("Products").get();
      final productList = documentSnapshot.docs
          .map((document) => ProductModel.fromJson(document))
          .toList();
      return productList;
    } on FirebaseException catch (e) {
      print("🔥 Firebase error: ${e.message}");
      throw 'Failed to get product data: ${e.message}';
    } catch (e, stack) {
      print("🔥 Unknown error: $e");
      print(stack);
      throw 'Failed to get product data. Please try again';
    }
  }
}

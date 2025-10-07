import 'package:ecommerce_app/features/products/data/models/product_model.dart';

abstract class ProductRepository {
  Future<List<ProductModel>> getProducts();
}

import 'package:ecommerce_app/core/constants/api_constants.dart';
import 'package:ecommerce_app/core/network/api_service.dart';
import 'package:ecommerce_app/features/products/data/models/product_model.dart';

class ProductRemoteDataSource {
  final ApiService apiService;

  ProductRemoteDataSource({required this.apiService});
  Future<List<ProductModel>> getProducts() async {
    final response = await apiService.get(ApiConstants.products);
    return (response.data['items'] as List)
        .map((e) => ProductModel.fromJson(e))
        .toList();
  }
}

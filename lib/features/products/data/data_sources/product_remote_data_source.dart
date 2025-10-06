import 'package:ecommerce_app/core/constants/api_constants.dart';
import 'package:ecommerce_app/core/network/api_service.dart';

class ProductRemoteDataSource {
  final ApiService apiService;

  ProductRemoteDataSource({required this.apiService});
  Future<List<dynamic>> getProducts() async {
    final response = await apiService.get(ApiConstants.products);
    return response.data;
  }
}

import '../api/product_api.dart';
import '../response/get_product_response.dart';

class ProductRepository {
  Future<ProductResponse?> getProducts() async {
    return ProductAPI().getProducts();
  }
}

import 'package:get/get.dart';
import '../models/product.dart';
import '../services/product_service.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList = <Product>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await ProductService().fetchProducts();
      productList.value = products;
    } finally {
      isLoading(false);
    }
  }
}

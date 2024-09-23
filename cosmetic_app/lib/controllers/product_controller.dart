import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductController extends GetxController {
  var products = [].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var response =
          await http.get(Uri.parse('https://dummyjson.com/products'));
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        products.value = jsonResponse['products'];
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to load products.");
    } finally {
      isLoading(false);
    }
  }
}

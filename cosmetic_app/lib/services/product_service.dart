import 'dart:convert';
import 'package:http/http.dart' as http;

class ProductService {
  Future<List<dynamic>> fetchProducts() async {
    final response =
        await http.get(Uri.parse('https://dummyjson.com/products'));

    if (response.statusCode == 200) {
      return json.decode(response.body)['products'];
    } else {
      throw Exception('Failed to load products');
    }
  }
}

import 'package:cosmetic_app/controllers/product_controller.dart';
import 'package:cosmetic_app/pages/detailPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text("Products")),
        body: Obx(() {
          if (productController.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            padding: EdgeInsets.all(8.0),
            itemCount: productController.products.length,
            itemBuilder: (context, index) {
              var product = productController.products[index];
              String title = product['title'] ?? 'No Title';
              String brand = product['brand'] ?? 'Unknown Brand';
              String thumbnail = product['thumbnail'] ?? 'https://via.placeholder.com/150';
              double price = product['price']?.toDouble() ?? 0.0;
      
              return Card(
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                elevation: 4.0,
                child: ListTile(
                  contentPadding: EdgeInsets.all(8.0),
                  leading: Image.network(
                    thumbnail,
                    width: 50,
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Brand - $brand",
                        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                  subtitle: Text(
                    "\$${price.toStringAsFixed(2)}",
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),
                  onTap: () => Get.to(DetailPage(product: product)),
                ),
              );
            },
          );
        }),
        backgroundColor: Colors.grey[200],
      ),
    );
  }
}
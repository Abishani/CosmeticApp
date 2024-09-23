import 'package:cosmetic_app/controllers/auth_controller.dart';
import 'package:cosmetic_app/controllers/product_controller.dart';
import 'package:cosmetic_app/pages/detailPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());
  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
        title: const Text('Product List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              authController.signOut();
            },
          ),
        ],
      ),
        body: Obx(() {
          if (productController.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            padding: EdgeInsets.all(8.0),
            itemCount: productController.productList.length,
            itemBuilder: (context, index) {
              var product = productController.productList[index];
              String title = product.title;
              String brand = product.brand;
              String thumbnail = product.thumbnail;
              double price = product.price.toDouble();
      
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
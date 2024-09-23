import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DetailPage extends StatelessWidget {
  final dynamic product;

  DetailPage({required this.product});

  @override
  Widget build(BuildContext context) {
    List<String> images = (product['images'] as List<dynamic>?)
            ?.map((item) => item as String)
            .toList() ??
        ['https://via.placeholder.com/600'];

    return Scaffold(
      appBar: AppBar(title: Text(product['title'])),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product['title'],
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              SizedBox(height: 20),
              CarouselSlider(
                options: CarouselOptions(height: 200.0, autoPlay: true, enlargeCenterPage: true),
                items: images.map((imageUrl) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Card(
                        margin: EdgeInsets.symmetric(horizontal: 10.0),
                        elevation: 5.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.network(imageUrl, fit: BoxFit.cover),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              Text(
                product['description'],
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    "Rating: ",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  RatingBar.builder(
                    initialRating: product['rating']?.toDouble() ?? 0.0,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 20.0,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {},
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                "Price: \$${product['price']}",
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
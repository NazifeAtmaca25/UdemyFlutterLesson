import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/product_controller.dart';
import 'package:getx/data/product_data.dart';
import 'package:getx/model/product.dart';
import 'package:getx/screens/favorite_page.dart';

class DetailPage extends StatelessWidget {
  ProductController controller;
  DetailPage({super.key, required this.controller});

  late var product = controller.currentProduct;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detay Sayfası")),
      body: Center(
        child: Column(
          children: [
            Text("Bilgiler"),
            Text("Id: ${product.value?.id}"),
            Text("Name: ${product.value?.name}"),
            Text("Price: ${product.value?.price}"),
            Text("Favori mi: ${product.value?.isFavorite}"),
            ElevatedButton(onPressed: () {}, child: Text("Geri dön")),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/product_controller.dart';
import 'package:getx/data/product_data.dart';
import 'package:getx/model/product.dart';

class DetailPage extends StatelessWidget {
   DetailPage({super.key});
   Product product=Get.arguments as Product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detay Sayfası"),),
      body: Center(
        child: Column(
          children: [
            Text("Bilgiler"),
            Text("Id: ${product.id}"),
            Text("Name: ${product.name}"),
            Text("Price: ${product.price}"),
            Text("Favori mi: ${product.isFavorite}"),
            ElevatedButton(onPressed: ()=>Get.back(), child: Text("Geri dön"))
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/favorite_controller.dart';
import 'package:getx/controller/product_controller.dart';
import 'package:getx/data/product_data.dart';
import 'package:getx/model/product.dart';
import 'package:getx/screens/detail_page.dart';
import 'package:getx/screens/favorite_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final productData = ProductData();
  late final productContoller = Get.put(ProductController(data: productData));
  late final favoriteController = Get.put(FavoriteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Anasayfa"),
            GestureDetector(
              onTap: () {
                print("aaaaaaa");
                Get.to(
                  () => FavoritePage(favoriController: favoriteController),
                );
                print("aaaaaaa bitti");
              },
              child: CircleAvatar(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                radius: 15,
                child: Obx(
                  () => Text(favoriteController.favoriteList.length.toString()),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: productContoller.productList.length,
          itemBuilder: (context, index) {
            return ListItemWidget(productContoller.productList[index]);
          },
        ),
      ),
    );
  }

  Widget ListItemWidget(Product urun) {
    return GestureDetector(
      onTap: () {
        print(urun);
        productContoller.currentProduct.value = urun;
        Get.to(
          () => DetailPage(controller: productContoller),
        ); //()=> kullanmak önemli
        //Get.toNamed("/detail", arguments: urun);
      },
      child: ListTile(
        title: Text(urun.name),
        trailing: IconButton(
          onPressed: () => favoriteController.toggleFavorite(urun),
          icon: Obx(
            () => Icon(
              urun.isFavorite.value ? Icons.favorite : Icons.favorite_border,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}

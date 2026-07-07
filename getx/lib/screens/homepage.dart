import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/product_controller.dart';
import 'package:getx/data/product_data.dart';
import 'package:getx/model/product.dart';
import 'package:getx/screens/detail_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final productData = ProductData();
  late final productContoller = Get.put(ProductController(data: productData));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Anasayfa"),
          CircleAvatar(
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            radius: 15,
            child: Obx(()=>Text(productContoller.favoriteItemsCount().toString())),
          )
        ],
      )),
      body: Obx(
        () => ListView.builder(
          itemCount: productContoller.productList.length,
          itemBuilder: (context, index) {
            var urun=productContoller.productList[index];
            return GestureDetector(
              onTap: (){
                print(urun);
                //Get.to(()=>DetailPage(),arguments:urun); //()=> kullanmak önemli
                Get.toNamed("/detail",arguments: urun);
              },
              child: ListTile(
                title: Text(urun.name),
                trailing: IconButton(
                  onPressed: () => productContoller.toggleFavorite(
                    urun
                  ),
                  icon:Obx(()=> Icon(
                    urun.isFavorite.value
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: Colors.red,
                  )),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

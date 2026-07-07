import 'package:get/get.dart';
import 'package:getx/data/product_data.dart';
import 'package:getx/model/product.dart';

class ProductController extends GetxController{
   final ProductData data;
   ProductController({required this.data});

   var productList=<Product>[].obs();

   @override
  void onInit() {
    super.onInit();
    getProduct();
  }

   void getProduct(){
     productList=data.getData();
   }

   void toggleFavorite(Product product){
     print(product.isFavorite.value);
     print("--------------------");
     product.isFavorite.value = !product.isFavorite.value;
     print(product.isFavorite.value);
   }

   int favoriteItemsCount(){
     return productList.where((e)=>e.isFavorite.value==true).toList().length;
   }
}
import 'package:get/get.dart';

class Product extends GetxController{
  final String id;
  final String name;
  final double price;
  final RxBool isFavorite;

  Product(this.id, this.name, this.price, this.isFavorite);
}
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:getx/controller/favorite_controller.dart';
import 'package:getx/controller/product_controller.dart';
import 'package:getx/data/product_data.dart';
import 'package:getx/screens/detail_page.dart';
import 'package:getx/screens/favorite_page.dart';
import 'package:getx/screens/homepage.dart';

class RoutePage {
  static final routes = [
    GetPage(name: "/", page: () => HomePage()),
    GetPage(
      name: "/favorite",
      page: () {
        final favoriteController = Get.put(FavoriteController());
        return FavoritePage(favoriController: favoriteController);
      },
    ),
    GetPage(
      name: "/detail",
      page: () {
        ProductData product = ProductData();
        final productData = Get.put(ProductController(data: product));
        return DetailPage(controller: productData);
      },
    ),
  ];
}

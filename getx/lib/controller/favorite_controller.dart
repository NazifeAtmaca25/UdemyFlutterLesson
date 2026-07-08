import 'package:get/get.dart';
import 'package:getx/model/product.dart';

class FavoriteController extends GetxController {
  // var favoriteList=<Product>[].obs();

  var favoriteList = RxList<Product>();
  var searchText = ''.obs;

  @override
  void onInit() {
    super.onInit();
    print("onInit çalıştı favorite");
  }

  @override
  void onClose() {
    print("onClose çalıştı favoriteda");
    super.onClose();
  }

  void toggleFavorite(Product product) {
    print(product.isFavorite.value);
    print("--------------------");
    product.isFavorite.value = !product.isFavorite.value;
    if (product.isFavorite.value) {
      print("liste uzunluğu");
      print(favoriteList.length.toString());
      favoriteList.add(product);
    } else {
      favoriteList.remove(product);
    }
    print(product.isFavorite.value);
  }

  List<Product> filterFavorite() {
    if (searchText.isEmpty) {
      return favoriteList;
    } else {
      return favoriteList
          .where((p) => p.name.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    }
  }
}

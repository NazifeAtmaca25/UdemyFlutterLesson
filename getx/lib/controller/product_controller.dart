import 'package:get/get.dart';
import 'package:getx/data/product_data.dart';
import 'package:getx/model/product.dart';

class ProductController extends GetxController {
  final ProductData data;

  ProductController({required this.data});

  var currentProduct = Rxn<Product>(); //Rxn null olabilir demek.
  var productList = <Product>[].obs();

  @override
  void onInit() {
    super.onInit();
    print("onInit çalıştı");
    getProduct();
  }

  @override
  // TODO: implement onStart
  InternalFinalCallback<void> get onStart => super.onStart;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    print("onReady çalıştı");
  }

  @override
  void onClose() {
    // TODO: implement
    print("cloedayım");
    super.onClose();
    print("close çalıştı");
  }

  void getProduct() {
    productList = data.getData();
  }
}

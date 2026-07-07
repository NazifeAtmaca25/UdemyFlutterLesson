import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:getx/model/product.dart';

class ProductData {
  List<Product> getData(){
    List<Product> product=[];
    for(int i=1;i<10;i++) {
      product.add(Product(i.toString(), "Ürün$i", i*13, false.obs));
    }
    return product;
  }
}
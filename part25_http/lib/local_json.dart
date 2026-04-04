import 'dart:convert';

import 'package:flutter/material.dart';

import 'car.dart';

class LocalJson extends StatefulWidget {
  const LocalJson({super.key});

  @override
  State<LocalJson> createState() => _LocalJsonState();
}

class _LocalJsonState extends State<LocalJson> {
  @override
  Widget build(BuildContext context) {
    carJsonOku();
    return Scaffold(
      appBar: AppBar(
        title: Text("Local Json Kullanımı"),
      ),
      body: Center(),
    );
  }

  Future<void> carJsonOku() async{
    String okunanString= await DefaultAssetBundle.of(context).loadString("assets/data/cars.json");
    var jsonObject=jsonDecode(okunanString);

    //jsonObjecten gelen map yapısı car sınıfında tanımladığımı constructer fromJson ile Car nesnesine yerleştirirlir.
    //map ile her bir araba nesnesi sırayla yerleştirilir.
    List<Car> allCar=(jsonObject as List).map((arabaMap)=>Car.fromJson(arabaMap)).toList();
    debugPrint(allCar[1].model[1].modelName.toString());
    
    /* debugPrint(okunanString);
    print("*****************************");
    List arabaListesi=jsonObject;
    debugPrint(arabaListesi[0]["car_name"]); */
  }
}

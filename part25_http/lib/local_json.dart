import 'dart:convert';

import 'package:flutter/material.dart';

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
    debugPrint(okunanString);
    print("*****************************");
    List arabaListesi=jsonObject;
    debugPrint(arabaListesi[0]["car_name"]);
  }
}

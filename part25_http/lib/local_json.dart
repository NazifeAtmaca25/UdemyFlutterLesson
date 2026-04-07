import 'dart:convert';

import 'package:flutter/material.dart';

import 'car.dart';

class LocalJson extends StatefulWidget {
  const LocalJson({super.key});

  @override
  State<LocalJson> createState() => _LocalJsonState();
}

class _LocalJsonState extends State<LocalJson> {

  String _title="Local Json Kullanımı";
  late final Future<List<Car>> _listeyiDoldur;

  @override
  void initState() {
    super.initState();
    _listeyiDoldur=carJsonOku();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_title)),
      floatingActionButton: FloatingActionButton(onPressed: (){
        setState(() {
          _title="Buton tıklandı";
        });
      }),
      body: FutureBuilder(
        future: _listeyiDoldur,
        initialData: [Car(carName: "Volvo", country: "İngiltere", establishmentYear: 2010, model: [Model(modelName: "d serisi", price: 30000, gasoline: true)])],
        builder: (context, snapchot) {
          if (snapchot.hasData) {
            List<Car> arabalar =
                snapchot.data!; //datada futuredan aldığımız veriler vardır
            return ListView.builder(
              itemCount: arabalar.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(arabalar[index].carName),
                  subtitle: Text(arabalar[index].country),
                  leading: Container(
                    color: Colors.grey,
                    child: Text(arabalar[index].model[0].price.toString()),
                  ),
                );
              },
            );
          } else if (snapchot.hasError) {
            return Center(child: Text(snapchot.error.toString()));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Future<List<Car>> carJsonOku() async {
    try {
      debugPrint('5 saniyelik işlem başlıyor');
      Future.delayed(Duration(seconds: 10),(){
        debugPrint('5 saniyelik işlem bitti');
      });
      String okunanString = await DefaultAssetBundle.of(
        context,
      ).loadString("assets/data/cars.json");
      var jsonObject = jsonDecode(okunanString);

      //jsonObjecten gelen map yapısı car sınıfında tanımladığımı constructer fromJson ile Car nesnesine yerleştirirlir.
      //map ile her bir araba nesnesi sırayla yerleştirilir.
      List<Car> allCar = (jsonObject as List)
          .map((arabaMap) => Car.fromJson(arabaMap))
          .toList();
      debugPrint(allCar[1].model[1].modelName.toString());

      return allCar;
    } catch (e) {
      print("Hata: $e");
      return Future.error(e.toString());
    }

    /* debugPrint(okunanString);
    print("*****************************");
    List arabaListesi=jsonObject;
    debugPrint(arabaListesi[0]["car_name"]); */
  }
}

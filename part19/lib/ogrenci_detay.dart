import 'package:flutter/material.dart';
import 'package:part19/ogrenci_listesi.dart';

class OgrenciDetay extends StatelessWidget {
  final Ogrenci secilenOgrenci;
  const OgrenciDetay({super.key, required this.secilenOgrenci});

  @override
  Widget build(BuildContext context) {
    var secilen=ModalRoute.of(context)!.settings.arguments as Ogrenci;
    print('secilen ogrenci :::: ${secilen.isim}');
    return Scaffold(
      appBar: AppBar(
        title: Text("Ogrenci Detay"),
      ),
      body: Center(
        child: Column(
          children: [
            Text(secilenOgrenci.id.toString()),
            Text(secilenOgrenci.isim),
            Text(secilenOgrenci.soyisim),
          ],
        ),
      ),
    );
  }
}

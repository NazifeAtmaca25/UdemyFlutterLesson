import 'package:flutter/material.dart';

class Popup extends StatefulWidget {
  const Popup({super.key});

  @override
  State<Popup> createState() => _PopupState();
}

class _PopupState extends State<Popup> {
  String _secilen="Ankara";
  List<String> renkler = ['mavi', 'yeşil', 'kırmızı', 'sari', 'siyah'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PopUp"),
      ),
      body: Center(
        child: PopupMenuButton(
          onSelected: (String sehir){
            print("secilen sehir: $sehir");
            setState(() {
              _secilen=sehir;
            });
          },
            itemBuilder: (BuildContext context){
              /*return <PopupMenuEntry<String>>[
                PopupMenuItem(value: "Ankara",child: Text("Ankara"),),
                PopupMenuItem(value: "Denizli",child: Text("Denizli"),),
                PopupMenuItem(value: "İstanbul",child: Text("İstanbul"),)
              ];*/
              return renkler.map((String renk)=>PopupMenuItem(value:renk,child: Text(renk))).toList();
            }),
      ),
    );
  }
}

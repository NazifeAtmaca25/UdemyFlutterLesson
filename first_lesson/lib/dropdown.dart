import 'package:flutter/material.dart';

class Dropdown extends StatefulWidget {
  const Dropdown({super.key});

  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  String? _secilensehir=null;
  final List<String> _tumSehirler = [
    'Ankara',
    'Bursa',
    'Istanbul',
    'Izmir',
    'Adıyaman',
    'Van'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DropDown"),
      ),
      body: Center(
        child: DropdownButton<String>(
          hint: Text("Sehir seçiniz"),
            style: TextStyle(color: Colors.purple),
            icon: Icon(Icons.arrow_downward),
            iconSize: 16,
           /* items: [
              DropdownMenuItem(value: 'Ankara',child: Text("Ankara Sehri"),),
              DropdownMenuItem(value: 'Bursa',child: Text("Bursa Sehri"),),
              DropdownMenuItem(value:'Denizli',child: Text("Denizli Sehri"))
            ],*/
            items:_tumSehirler
                .map(
                  (String oankiSehir) => DropdownMenuItem(
                child: Text(oankiSehir),
                value: oankiSehir,
              ),
            )
                .toList(),
            value: _secilensehir,
            onChanged: (String? yeni){
              setState(() {
                _secilensehir=yeni;
              });
            }),
      ),
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:part27_hive_depolama/model/my_model.dart';

class SharedPrefUsing extends StatefulWidget {
  const SharedPrefUsing({super.key});

  @override
  State<SharedPrefUsing> createState() => _SharedPrefUsingState();
}

class _SharedPrefUsingState extends State<SharedPrefUsing> {
  var _secilenCinsiyet = Cinsiyet.KADIN;
  var _secilenRenkler = [];
  var _ogrenciMi = false;
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Shared Preferences Kullanımı")),
      body: ListView(
        children: [
          ListTile(
            title: TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: "Adınızı giriniz"),
            ),
          ),
          
          RadioGroup(
            groupValue: _secilenCinsiyet,
              onChanged: (Cinsiyet? secilmisCinsiyet){
            setState(() {
              _secilenCinsiyet=secilmisCinsiyet!;
            });
          }, child: Column(
            children: [
              buildRadioListTile("Kadın", Cinsiyet.KADIN),
              buildRadioListTile("Erkek", Cinsiyet.ERKEK),
              buildRadioListTile("Diğer", Cinsiyet.DIGER),
            ],
          )),

          buildCheckboxListTile(Renkler.KIRMIZI),
          buildCheckboxListTile(Renkler.MAVI),
          buildCheckboxListTile(Renkler.MOR),
          buildCheckboxListTile(Renkler.PEMBE),
          buildCheckboxListTile(Renkler.SARI),
          
          SwitchListTile(
            title: Text("Öğrenci misin"),
              value: _ogrenciMi, onChanged: (bool ogrenciMi){
            setState(() {
              _ogrenciMi=ogrenciMi;
            });
          }),
          TextButton(onPressed: (){}, child: Text("Kaydet"))
        ],
      ),
    );
  }

  CheckboxListTile buildCheckboxListTile(Renkler renk) {
    return CheckboxListTile(
          title: Text(renk.name),
          value: _secilenRenkler.contains(renk.name),
          onChanged: (bool? deger){
            if(deger== false){
              _secilenRenkler.remove(renk.name);
            } else{
              _secilenRenkler.add(renk.name);
            }
            setState(() {
              debugPrint(_secilenRenkler.toString());
            });
          },
        );
  }

  RadioListTile<Cinsiyet> buildRadioListTile(String title, Cinsiyet cinsiyet) {
    return RadioListTile<Cinsiyet>(
      value: cinsiyet,
      title: Text(title),
    );
  }
}

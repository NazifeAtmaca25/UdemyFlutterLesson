import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:part27_hive_depolama/model/my_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefUsing extends StatefulWidget {
  const SharedPrefUsing({super.key});

  @override
  State<SharedPrefUsing> createState() => _SharedPrefUsingState();
}

class _SharedPrefUsingState extends State<SharedPrefUsing> {
  var _secilenCinsiyet = Cinsiyet.KADIN;
  var _secilenRenkler = <String>[];
  var _ogrenciMi = false;
  final TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    verileriGetir();
  }

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
            onChanged: (Cinsiyet? secilmisCinsiyet) {
              setState(() {
                _secilenCinsiyet = secilmisCinsiyet!;
              });
            },
            child: Column(
              children: [
                for (var item in Cinsiyet.values)
                  buildRadioListTile(item.name, item),
              ],
            ),
          ),

          for (var item in Renkler.values) buildCheckboxListTile(item),

          SwitchListTile(
            title: Text("Öğrenci misin"),
            value: _ogrenciMi,
            onChanged: (bool ogrenciMi) {
              setState(() {
                _ogrenciMi = ogrenciMi;
              });
            },
          ),
          TextButton(onPressed: _verileriKaydet, child: Text("Kaydet")),
        ],
      ),
    );
  }
  void _verileriKaydet() async{
    final name=_nameController.text;
    final prefences= await SharedPreferences.getInstance();
    
    prefences.setString("isim", name);
    prefences.setBool("ogrenci", _ogrenciMi);
    prefences.setInt("cinsiyet", _secilenCinsiyet.index);
    prefences.setStringList("renkler", _secilenRenkler);
    debugPrint("cinsiyet:${_secilenCinsiyet.index} renkler:$_secilenRenkler öğrenci:$_ogrenciMi");
  }

  void verileriGetir() async{
    final preferences=await SharedPreferences.getInstance();
    _nameController.text=preferences.getString("isim") ?? "";
    _ogrenciMi=preferences.getBool("ogrenci") ?? false;
    _secilenCinsiyet=Cinsiyet.values[preferences.getInt("cinsiyet") ?? 0];
    _secilenRenkler=preferences.getStringList("renkler") ?? <String>[];
  }

  CheckboxListTile buildCheckboxListTile(Renkler renk) {
    return CheckboxListTile(
      title: Text(renk.name),
      value: _secilenRenkler.contains(renk.name),
      onChanged: (bool? deger) {
        if (deger == false) {
          _secilenRenkler.remove(renk.name);
        } else {
          _secilenRenkler.add(renk.name);
        }
        setState(() {
          debugPrint(_secilenRenkler.toString());
        });
      },
    );
  }

  RadioListTile<Cinsiyet> buildRadioListTile(String title, Cinsiyet cinsiyet) {
    return RadioListTile<Cinsiyet>(value: cinsiyet, title: Text(title));
  }
}

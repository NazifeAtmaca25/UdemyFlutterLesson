import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:part27_hive_depolama/model/my_model.dart';
import 'package:part27_hive_depolama/services/file_storage.dart';
import 'package:part27_hive_depolama/services/local_storage_services.dart';
import 'package:part27_hive_depolama/services/secure_storage_services.dart';
import 'package:part27_hive_depolama/services/shared_pref_services.dart';
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
  final LocalStorageServices _preferenceService=FileStorage();

  @override
  void initState() {
    super.initState();
    verileriOku();
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
          TextButton(onPressed: (){
            UserInformation information=UserInformation(_nameController.text, _secilenCinsiyet, _secilenRenkler, _ogrenciMi);
            _preferenceService.verileriKaydet(information);
          }, child: Text("Kaydet")),
        ],
      ),
    );
  }
  void verileriOku() async{
    var info= await _preferenceService.verileriGetir();
    _nameController.text=info.isim;
    _secilenCinsiyet=info.cinsiyet;
    _secilenRenkler=info.renkler;
    _ogrenciMi=info.ogrenciMi;
    setState(() {

    });
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

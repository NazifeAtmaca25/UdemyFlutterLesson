import 'package:part27_hive_depolama/model/my_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefServices {
  late final preferences;
  void verileriKaydet(UserInformation information) async{
    final name=information.isim;
    final prefences= await SharedPreferences.getInstance();

    prefences.setString("isim", name);
    prefences.setBool("ogrenci", information.ogrenciMi);
    prefences.setInt("cinsiyet", information.cinsiyet.index);
    prefences.setStringList("renkler", information.renkler);
  }

  Future<UserInformation> verileriGetir() async{
    preferences=await SharedPreferences.getInstance();
    var _isim=preferences.getString("isim") ?? "";
    var _ogrenciMi=preferences.getBool("ogrenci") ?? false;
    var _cinsiyet=Cinsiyet.values[preferences.getInt("cinsiyet") ?? 0];
    var _renkler=preferences.getStringList("renkler") ?? <String>[];

    return UserInformation(_isim, _cinsiyet, _renkler, _ogrenciMi);
  }
}
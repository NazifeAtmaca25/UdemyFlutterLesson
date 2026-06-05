import 'package:part27_hive_depolama/model/my_model.dart';
import 'package:part27_hive_depolama/services/local_storage_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefServices implements LocalStorageServices{
  late final preferences;

  SharedPrefServices(){
    init();
  }

  Future<void> init() async{
    preferences=await SharedPreferences.getInstance();
  }

  @override
  Future<void> verileriKaydet(UserInformation information) async{
    final name=information.isim;
    preferences.setString("isim", name);
    preferences.setBool("ogrenci", information.ogrenciMi);
    preferences.setInt("cinsiyet", information.cinsiyet.index);
    preferences.setStringList("renkler", information.renkler);
  }

  @override
  Future<UserInformation> verileriGetir() async{
    var _isim=preferences.getString("isim") ?? "";
    var _ogrenciMi=preferences.getBool("ogrenci") ?? false;
    var _cinsiyet=Cinsiyet.values[preferences.getInt("cinsiyet") ?? 0];
    var _renkler=preferences.getStringList("renkler") ?? <String>[];

    return UserInformation(_isim, _cinsiyet, _renkler, _ogrenciMi);
  }
}
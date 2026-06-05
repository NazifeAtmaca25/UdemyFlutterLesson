import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:part27_hive_depolama/model/my_model.dart';
import 'package:part27_hive_depolama/services/local_storage_services.dart';

class SecureStorageServices implements LocalStorageServices {
  late final FlutterSecureStorage preferences;

  SecureStorageServices() {
    print("secure storage kurucusu çalıştı.");
    preferences = FlutterSecureStorage();
  }

  @override
  Future<void> verileriKaydet(UserInformation information) async {
    final name = information.isim;
    await preferences.write(key: "isim", value: name);
    await preferences.write(
      key: "ogrenci",
      value: information.ogrenciMi.toString(),
    );
    await preferences.write(
      key: "cinsiyet",
      value: information.cinsiyet.index.toString(),
    );
    await preferences.write(
      key: "renkler",
      value: jsonEncode(information.renkler),
    );
  }

  @override
  Future<UserInformation> verileriGetir() async {
    var _isim = await preferences.read(key: "isim") ?? "";
    var _ogrenciString =
        await preferences.read(key: 'ogrenci') ?? 'false'; // 'true' / 'false'
    var _ogrenci = _ogrenciString.toLowerCase() == 'true' ? true : false;
    var _cinsiyetString = await preferences.read(key: "cinsiyet") ?? "0";
    var _cinsiyet = Cinsiyet.values[int.parse(_cinsiyetString)];
    var _renklerString = await preferences.read(key: "renkler");
    var _renkler = _renklerString == null
        ? <String>[]
        : List<String>.from(jsonDecode(_renklerString));
    return UserInformation(_isim, _cinsiyet, _renkler, _ogrenci);
  }
}

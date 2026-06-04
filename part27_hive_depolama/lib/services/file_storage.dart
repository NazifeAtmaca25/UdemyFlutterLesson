import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:part27_hive_depolama/services/local_storage_services.dart';
import 'package:path_provider/path_provider.dart';

import '../model/my_model.dart';

class FileStorage implements LocalStorageServices{

  _getFilePath() async{
    var filePath= await getApplicationDocumentsDirectory();
    //Bir uygulamanın kullanıcı tarafından oluşturulan verileri veya kolayca
    // yeniden oluşturulamayan verileri depolayabileceği kalıcı bir dizin bulur
    debugPrint(filePath.path);
    return filePath.path;
  }


  FileStorage(){
    _createFile();
  }

  Future<File> _createFile() async{
    var file=File(await _getFilePath()+'/info.json');
    return file;
  }


  @override
  Future<void> verileriKaydet(UserInformation information) async{
    var file=await _createFile();
    await file.writeAsString(jsonEncode((information)));
  }

  @override
  Future<UserInformation> verileriGetir() async{
    try{
      var file=await _createFile();
      var dosyaStringIcerik=await file.readAsString();

      Map<String, dynamic> json=jsonDecode(dosyaStringIcerik);
      return UserInformation.fromJson(json);
    } catch(e){
      debugPrint(e.toString());
    }
    return UserInformation("", Cinsiyet.KADIN, [], false);
  }
}
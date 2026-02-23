import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:part19/main.dart';
import 'package:part19/ogrenci_detay.dart';
import 'package:part19/ogrenci_listesi.dart';
import 'package:part19/orange_page.dart';
import 'package:part19/purple_page.dart';
import 'package:part19/yellow_page.dart';

class RouteGenerator {
  //buradaki setting sayfa değiştirirken alınan setting bilgilerini gidilen sayfaya aktarmak
  static Route<dynamic>? routeOlustur(RouteSettings setting, Widget gidilecek){
    if(defaultTargetPlatform==TargetPlatform.iOS){
      return CupertinoPageRoute(builder: (context)=>gidilecek,settings: setting);
    } else if(defaultTargetPlatform==TargetPlatform.android){
      return MaterialPageRoute(builder: (context)=>gidilecek,settings: setting);
    } else{
      return CupertinoPageRoute(builder: (context)=>gidilecek,settings: setting);
    }
  }
  static Route<dynamic>? routeGenerator(RouteSettings settings){
    switch(settings.name){
      case '/':
        return routeOlustur(settings, AnaSayfa());
      case '/orangePage':
        return routeOlustur(settings, OrangePage());
      case '/purplePage':
        return routeOlustur(settings, PurplePage());
      case '/yellowPage':
        return routeOlustur(settings, YellowPage());
      case '/ogrenciListesi':
        return routeOlustur(settings, OgrenciListesi());
      case '/ogrenciDetay':
        var parametredeliOgrenci=settings.arguments as Ogrenci;
        return routeOlustur(settings, OgrenciDetay(secilenOgrenci: parametredeliOgrenci));

        default:
          return MaterialPageRoute(builder: (context)=>Scaffold(
            appBar: AppBar(title: Text("Error"),),
            body: Center(child: Text("Hatalı Sayfa"),),
          ));



    }
  }
}
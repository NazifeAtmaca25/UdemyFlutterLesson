import 'dart:io';
import 'dart:math';

void main(List<String> args){
  /*List<int> sayilar=List.filled(3, 2);
  //print(sayilar);
  sayilar[0]=5;
  //print(sayilar);

  Set<String> isimler=Set();
  isimler.add("Nazife");
  isimler.add("Nazife");
  isimler.add("akdakdhakjsdh");
  isimler.add("askdj");
  isimler.add("Na3kşldşzife");
  isimler.add("Naaşdşlakdzife");
  isimler.remove("Naaşdşlakdzife");

  Set<int> numaralar=Set.from([1,1,1,1,2,2,2,6,6,6,3,3,34,4,8,8,8]);
  List<int> num=[9,9,97,7,7,5,5,5,5,8];
  numaralar.clear();
  numaralar.addAll(num);

  Map<String,dynamic> nazife={
    "soyad":"atmaca",
    "yaş":22,
    "boy":154
  };

for(String oAnkiAnahtar in nazife.keys){
  print(oAnkiAnahtar);//key
  print(nazife[oAnkiAnahtar]);
}
for(var deger in nazife.values){
  print(deger);
}
  for (var element in nazife.entries) {
    print("Key : ${element.key} değeri : ${element.value}");
  }*/

  List <String> cities=["Denizli","İzmir"];
  cities.add("Ankara");
  cities.add("İstanbul");
  cities.add("Eskişehir");
  cities.add("Bursa");

  for(String city in cities){
    //print(city);
  }

  Map<String, dynamic> cp= {};

  cp["çekirdek sayısı"]=16;
  cp["ram"]=8;
  cp["ssd var mı"]=true;

  for(var oAnkiEntity in cp.entries){
   // print(oAnkiEntity);
  }

  List<Map<String,dynamic>> iller=<Map<String,dynamic>>[
    {"il":"denizli","İlçe sayısı":16,"plaka kodu":20},
    {"il":"ankara","İlçe sayısı":15,"plaka kodu":01},
    {"il":"istanbul","İlçe sayısı":27,"plaka kodu":34},
    {"il":"eskişehir","İlçe sayısı":20,"plaka kodu":26},
  ];

  for(var il in iller){
   // print("**********************");
    for(var oAnkiIl in il.entries){
      //print("${oAnkiIl.key}=${oAnkiIl.value}");
    }
  }

  List<int> numara1=List.filled(5, 0);
  var numara2=List<int>.filled(5,0);

  for(int i=0;i<numara1.length;i++){
    numara1[i]=Random().nextInt(50);
    numara1[i]*=numara1[i];
    numara2[i]=Random().nextInt(50);
    numara2[i]*=numara2[i];
  }

  var newList=<int>[...numara1,...numara2];
  //print(newList);
  Set<int> newSet= <int>{};
  newSet.addAll(newList);
  //print(newSet);

  List<int> nums=<int>[];
  int sum=0;
  int num;
  do{
    print("Bir sayı giriniz");
    num=int.parse(stdin.readLineSync()!);
    if(num != -1){
      nums.add(num);
      sum+=num;
    }
  } while(num != -1);
  print("Girilen sayılar: $sum");
  print("Girilen sayıların ortalaması: ${sum/nums.length}");



}
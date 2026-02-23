void main(List<String> args){
  Person emre = Person(3, "emre");
  Ogrenci hasan = Ogrenci(1, "hasan", 10);
  Person ayse = Ogrenci(8, "ayse", 8);
  var yunus = Person(6, "yunus");
  var ali = Ogrenci(4, "ali", 4);

  List<Person> tumOgrenciler = [emre, hasan, ayse, yunus, ali];

  tumOgrenciler.sort((ogr1,ogr2){
    if(ogr1.id<ogr2.id){
      return 1;
    } else if(ogr1.id>ogr2.id){
      return -1;
    }else {
      return 0;
    }
  });
  print(tumOgrenciler);

  var mapList=tumOgrenciler.map((Person e)=> "${e.id}").toList();
  //liste alır ve o listedeki elemanları yazılan şeye göre tekrar bi liste oluşturur.
  print(mapList);

  bool sonuc=tumOgrenciler.any((Person element)=>element.id>3);
  print(sonuc);

  Map<int,Person> yeniMap=tumOgrenciler.asMap();
  print(yeniMap[0]!.isim);

  bool sonucEvery=tumOgrenciler.every((element)=> element.isim.length>0);
  //her isimin uzunluğuna bakar ve hepsinin uzunluğu 0 dan büyük mü kontorl eder.
  print(sonucEvery);

  var bulunan = tumOgrenciler.firstWhere((element) => element.id == 1);
  print(bulunan);

}
class Person {
  int id = 0;
  String isim = "";

  Person(this.id, this.isim);
  @override
  String toString() {
    return "id:$id ve isim:$isim\n";
  }
}

class Ogrenci extends Person {
  int alinanDersSayisi = 0;
  Ogrenci(id, isim, alinanDersSayisi) : super(id, isim);

  @override
  String toString() {
    return "id:$id ve isim:$isim ve alinan ders sayısı:$alinanDersSayisi\n";
  }
}
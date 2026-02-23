main(List<String> args) async{
  Map<String,String> kisiler={"1":"Nazife","2":"Gökçe","3":"Zeki"};
  Map<String,List<String>> dersler={
    "Gökçe":["Matematik","fizik","kimya"],
    "Zeki":["Futbol","Basketbol","Voleybol"],
    "Nazife":["Müzik","Resim"]
  };
  Map<String,String> yorumlar={
    "Matematik":"Çok zor bir ders",
    "fizik":"Bu dersi çok seviyorum",
    "kimya":"Kimyadan nefret ederim",
    "Futbol":"Futbol oynasını çok severim",
    "Basketbol":"Oynaması çok zor",
    "Voleybol":"Fena değil",
    "Müzik":"Gitar çalmasına bayılıyorum",
    "Resim":"Bu konuda pek becerikli değilim :("
  };

  String sonucName=await isimGetir("3", kisiler);
  print(sonucName);
  var sonuc= await dersleriGetir("3", kisiler, dersler);
  print(sonuc);
  String yorum= await yorumGetir(sonuc[0], yorumlar);
  print(yorum);
}
Future<String> yorumGetir(String deger, Map liste){
  return Future.delayed(Duration(seconds: 1),(){
    return liste[deger];
  });
}
Future<List> dersleriGetir(String id,Map liste, Map liste2) async{
  String name= await isimGetir(id,liste);
  return Future.delayed(Duration(seconds: 4),(){
    return liste2[name];
  });
}

Future<String> isimGetir(String id, Map liste){
  return Future<String>.delayed(Duration(seconds: 2),() {
      for(var deger in liste.entries){
        if(deger.key==id){
          return deger.value;
        }
      }
      return "Deger bulunamadı";

  });
}
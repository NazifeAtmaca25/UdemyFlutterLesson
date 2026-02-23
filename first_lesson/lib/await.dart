main(List<String> args) async{
  print("internetten kişi verisi getirilecek");
  //veriGetir().then((value)=>print(value));
  String sonuc= await veriGetir();
  print(sonuc);
  kisiyleIlgiliIslemler();
  print("Veriler getirildi.");
}
void kisiyleIlgiliIslemler() async{
  String kisi= await veriGetir();
  print(kisi.length);
}
Future<String> veriGetir(){
  return Future.delayed(Duration(seconds: 2),(){
    return "Veri isim: Nazife id:2";
  });
}
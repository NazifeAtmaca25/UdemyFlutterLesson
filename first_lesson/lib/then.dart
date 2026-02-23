import 'dart:io';

main(List<String> args){
  print("Anne çoğucu yemek almaya yollar");
  //uzunIslem();
  uzunIslem()
      .then((value)=>print(value))
      .catchError((hata)=>print(hata))
      .whenComplete(()=>print("Ekmek alma operasyonu bitti"));
  print("Peynir zeytin ayarlanır");
  print("Kahvaltı hazırlanır");
}
Future<String> uzunIslem(){
 return Future<String>.delayed(Duration(seconds: 5),(){
    return "Çocuk ekmeği getirir";
    throw Exception("Bakkalda ekmek kalmamış");
 }
  );
}
import 'dart:io';

main(List<String> args){
  print("Anne çoğucu yemek almaya yollar");
  //uzunIslem();
  uzunIslem2();
  print("Peynir zeytin ayarlanır");
  print("Kahvaltı hazırlanır");
}
void uzunIslem2(){
  print("Çocuk evden çıkar");
  Future.delayed(Duration(seconds: 5),()=>print("Çocuk ekmeği getirir"));
}

void uzunIslem(){
  print("Çocuk evden çıkar");
  sleep(Duration(seconds: 5));
  print("Çocuk ekmeği getirir");
}
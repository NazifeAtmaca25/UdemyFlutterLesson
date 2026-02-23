import 'dart:math';

main(List<String> args){
 try{
   double deger=karaKokAl(-20);
   print("Değer ${deger.toStringAsFixed(2)}");
 }on FormatException catch(e) {
   print(e.message);
 }catch(e){
   print(e);
 }
}

double karaKokAl(int i){
  if(i<0){
    throw FormatException("Sayı negatif olamaz");
  }else{
    return sqrt(i);
  }
}
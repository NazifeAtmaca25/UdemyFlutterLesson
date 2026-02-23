main(List<String> args){

  try{
    Ogrenci nazife=Ogrenci(-5);
    print(nazife.yas);
  }on AgeException catch(e){
    print(e.mesaj);
  } finally{
    print("Program bitti");
  }
}
class AgeException implements Exception{
  String mesaj;
  AgeException({this.mesaj='AgeException'});
  @override
  String toString() {
    return "Hatanın toString metodu çalıştı";
  }
}
class Ogrenci{
  int yas=0;

  Ogrenci(int yas){
    if(yas<0){
      throw AgeException(mesaj: "AgeException-Yas negatif olamaz");
    }else{
      this.yas=yas;
    }
  }
}
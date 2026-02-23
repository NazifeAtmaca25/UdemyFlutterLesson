void main(List<String> args){
  Matematik m1 = Matematik(50, 20);
  m1.topla();
  m1.topla();
  m1.topla();
  m1.topla();
  m1.cikar();

  Matematik m2 = Matematik(30, 10);
  m2.topla();
  m2.cikar();
  m2.cikar();
  m2.cikar();
  m2.cikar();

  Matematik m3 = Matematik(10, 5);
  m3.topla();
  m3.cikar();
  m3.cikar();
  m3.cikar();
  m3.cikar();

  print(Matematik.PI);
  Matematik.sinifAdiniSoyle();

  print("Toplam işlem sayısı ${Matematik.toplamIslemSayisi}");
}
class Matematik{

  int birinciSayi=0;
  int ikinciSayi=0;
  static int toplamIslemSayisi=0;

  static double PI =3.14;
  static void sinifAdiniSoyle(){
    print("Matematik sınıfı");
  }

  Matematik(this.birinciSayi, this.ikinciSayi);

  void topla(){
    sinifAdiniSoyle();
    toplamIslemSayisi++;
    print("Toplam ${birinciSayi + ikinciSayi}");
  }

  void cikar(){
    toplamIslemSayisi++;
    print("Toplam ${birinciSayi - ikinciSayi}");
  }

}
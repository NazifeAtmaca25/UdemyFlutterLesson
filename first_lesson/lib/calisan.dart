void main(List<String> args){
  Kisi emre=Kisi("nazife", 20);
  emre.kendiniTanit();

  Calisan hasan=Calisan("ömer", 15, 20000);
  hasan.kendiniTanit();
}
class Kisi{
  String isim;
  int yas;
  Kisi(this.isim, this.yas);

  void kendiniTanit(){
    print("Benim adım $isim ve yasim $yas");
  }

}

class Calisan extends Kisi{
  int maas;

  Calisan(String name, int age, this.maas) : super(name, age);

  @override
  void kendiniTanit() {
    super.kendiniTanit();
    print("Maaşım da $maas");
  }
}
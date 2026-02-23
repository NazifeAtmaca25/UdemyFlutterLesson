void main(List<String> args){
Asker emre=Asker("nazife", 22);
Er nazife=Er("nazife", 20);
nazife.memleketDegistir("Denizli");
nazife.selamla();
}
class Asker{
  String ad= "Varsayılan";
  int yas=0;
  String memleket="Ankara";

  Asker(this.ad, this.yas){
    print("Asker sınıfının kurucusu çalıştı");
  }
  void selamla() {
    print("Merhaba adım $ad ve yasım $yas");
  }
}
class Er extends Asker{

  Er(String ad, int yas) : super(ad, yas){
    print("Er sınıfından kurucu çalıştı");
  }
  void memleketDegistir(String yeniMemleket){
    super.memleket=yeniMemleket;
  }
  @override
  void selamla() {
    print("Er sınıfından selamlar");
  }
}
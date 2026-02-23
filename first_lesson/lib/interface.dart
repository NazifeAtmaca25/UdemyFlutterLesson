void main(List<String> args){}
abstract class Hayvan{
  void soyutOlmayanMetot(){
    print("Metodun tanımı");
  }
  void ksdjskdj(){
    print("lskdfjlsdkf");
  }
}
abstract class Ucabilenler{
  void fly();
  void ucmak();
}
abstract class Kosabilenler{
  void run();
}
class Kopek extends Hayvan implements Kosabilenler,Ucabilenler{
  @override
  void fly() {
    // TODO: implement fly
  }

  @override
  void run() {
    // TODO: implement run
  }

  @override
  void ucmak() {
    // TODO: implement ucmak
  }

}
void main(List<String> args){

  Araba honda=Araba(2020, "Honda", true);
  honda.bilgileriSoyle();
  var reno=Araba(2019, "Reno", false);
  reno.bilgileriSoyle();

  var suziki=Araba.modelYiliOlmayanKurucuModel("Suziki", true);
  suziki.bilgileriSoyle();
}
class Araba{
  int? modelYili;
  String? marka;
  bool? otomatikMi;

  Araba(this.modelYili, this.marka, this.otomatikMi){
    print("Kurucu metod tetiklendi.");
  }

  Araba.markasizKurucuMetod(this.modelYili, this.otomatikMi);
  Araba.modelYiliOlmayanKurucuModel(this.marka, this.otomatikMi);
  
  void bilgileriSoyle(){
    print("Arabanın model yili ${modelYili}, markası : ${marka} otomatik mi:${otomatikMi}");
  }
}
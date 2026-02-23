void main(List<String> args){
 Cember cember=Cember(0);
 print("Cevre: ${cember.cevreHesapla()}");
 print("Alan: ${cember.alanHesapla()}");

}
class Cember{
  int _radius=1;
  double _pi=3.14;

  Cember(int yaricap){
    yaricapKontrol=yaricap;
  }

  void set yaricapKontrol(int deger){
    if(deger>0){
      _radius=deger;
    }else{
      _radius=1;
    }
  }

  double cevreHesapla()=> 2*_radius*_pi;
  double alanHesapla()=>_radius*_radius*_pi;

}
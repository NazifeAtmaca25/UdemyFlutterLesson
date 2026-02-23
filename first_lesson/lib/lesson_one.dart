void main(List<String> args){
  User user1 = User();
  var user2 = NormalUser();
  SadeceOkuyabilenNormalUser user3 = SadeceOkuyabilenNormalUser();
  AdminUser user4 = AdminUser();
  user4.girisYap();

  User user5 = AdminUser();
  User user6 = SadeceOkuyabilenNormalUser();
}
class User{
  String email="";
  String password="";
  
  void girisYap(){
    print("Parent user giriş yaptı");
  }
}
class NormalUser extends User{
  void davetEt(){
    print("Normal user arkadaşlarını davet etti");
  }
  @override
  void girisYap() {
    print("Normal user giriş yaptı");
  }
}
class SadeceOkuyabilenNormalUser extends NormalUser{
  void adiniSoyle(){
    print("Ben sadeve okuyabilirim");
  }
  @override
  void girisYap() {
    print("SadeceOkuyabilenNormalUser giriş yaptı");
  }
}
class AdminUser extends User{
  void toplamKullaniciSayisiniGoster(){
    print("Toplam user sayısı 20");
  }
}
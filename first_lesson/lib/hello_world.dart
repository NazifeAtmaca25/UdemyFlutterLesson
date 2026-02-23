import 'dart:io';

void main(List<String> args){
 /*String name="nazife";
 String surname="atmaca";
 int age=22;
 print("Benim adım $name $surname,yaşım $age ve tüm ismimdeki karakter sayısı: ${name.length+surname.length}");


 int first=3;
 int second=4;
 int third=5;
 print("Birinci kenarı $first, ikinic kenarı $second ve üçüncü kenarı $third olan üçgenin çevresi: ${first+second+third}");


 int notDegeri=75;
 if(notDegeri>90) print("AA");
 else if(notDegeri>80) print("AB");
 else if(notDegeri>70) print("BA");
 else print("FF");

 String? ad="Nazife";
 String? soyad=null;
 String? mesaj;
 mesaj=ad ?? soyad;
 print(mesaj);

 String not="LSDKJFLSKJ";

 switch(not){
  case "AA":
   print("Notunuz 100");
  case "AB":
   print("Notunuz 90");
  case "BA":
   print("Notunuz 80");
  case "BB":
   print("Notunuz 70");
  case "DD":
   print("Notunuz 50");
  default:
   print("geçerili değer giriniz");
 }

 int sayi=10;
 print(++sayi);
 print(sayi++);

 for(int i=0; i<=10;i++){
  if(i%2==0) print(i);
 }

 List<String> isim= ["nazife","ömer","meryem"];
 for(String gecici in isim){
  print(gecici);
 }

 int sayac=0;

 while(sayac<3){
  print(sayac);
  sayac++;
 }
 int sayac2=0;
 do{
  print("do while sayac $sayac2");
  sayac2++;
 }while(sayac2<5);

 disdongu:for(int i =1;i<4;i++){
  for(int j=1;j<4;j++){
   if(i==2){
    break disdongu;
 }
   print("$i * $j = ${i*j}");
  }
 }

  double number1=12.5;
  double number2=39.1;
  double number3=9;
  double newNumber=(number1+number2+number3)/3;
  print(newNumber);

  int kenar1,kenar2,kenar3;
  kenar1=20;
  kenar2=20;
  kenar3=20;

  if(kenar1==kenar2 && kenar2==kenar3) print("Bu üçgen eşkenar üçgendir.");
  else if(kenar1==kenar2 || kenar2==kenar3 ||kenar1==kenar3) print("Bu üçgen ikizkenar üçgendir");
  else{
    print("Bu üçgen çeşit kenardır");
  }

  int vize=70;
  int final2=10;
  double result=(vize*4+final2*6)/10;
  String sonuc=result>50?"Dersi geçtiniz":"Dersten kaldınız";
  print(sonuc);

  String name="Nazife Atmaca";
  print("FOR döngüsü");
  for(int i=0;i<5;i++) print(name);
  print("While döngüsü");
  int sayac=0;
  while(sayac<5){
    print("$sayac $name");
    sayac++;
  }
  print("Do While döngüsü");
  int sayac2=0;
  do{
    print("$sayac2 $name");
    sayac2++;
  }while(sayac2<5);

  for(int i=1;i<=100;i++){
    if(i%15==0){
      print(i*i);
    }
  }

  int number=2;
  int sonuc=1;
  for(int i=1;i<=number;i++){
    sonuc =sonuc*i;
  }
print(sonuc);

  print("İsminizi giriniz:");
  String? isim=stdin.readLineSync();
  print("Girilen isim: $isim");

  print("Yaşınızı giriniz:");
  int? yas=int.parse(stdin.readLineSync()!);
  print("Girilen yaş: $yas");

  print("Birinci notu giriniz:");
  int first=int.parse(stdin.readLineSync()!);
  print("İkinci notu giriniz:");
  int second=int.parse(stdin.readLineSync()!);
  print("Notunuzun ortalaması: ${(first+second)/2}");

  print("Alacağınız ürünün fiyatını giriniz:");
  int fiyat=int.parse(stdin.readLineSync()!);
  double newFiyat=fiyat+fiyat*18/100;
  print("Bu ürünün kdv ile fiyatı: $newFiyat");
  cevrehesapla();
  print(alanHesapla(3, 7));
  print("Dikdörtgenin alanı: ${hacimHesapla(5, 6, 4)}");*/

  findTriangle(kenar1: 15,kenar2: 30,kenar3: 15);
}

 void findTriangle({int kenar1=1,int kenar2=1, int kenar3=1}){
   if(kenar1==kenar2 && kenar2==kenar3) print("Bu üçgen eşkenar üçgendir.");
   else if(kenar1==kenar2 || kenar2==kenar3 ||kenar1==kenar3) print("Bu üçgen ikizkenar üçgendir");
   else print("Bu üçgen çeşit kenardır");

 }
 double daireAlan(int r,[double pi=3.14])=> pi*r*r;

/*
  void ciftSayi(int a){
  int result=0;
  for(int i=1;i<=a;i++){
    if(i%2==0){
      result+=i;
    }
  }
  print(result);
 }

void cevrehesapla(){
  int boy=10,en=8;
  int cevre=2*boy+2*en;
  print("Dörtgenin çevresi:$cevre");
}
int alanHesapla(int sayi1,int sayi2) => sayi1*sayi2;

int hacimHesapla(int sayi1, int sayi2, int sayi3)=> sayi1*sayi2*sayi3;

int maxOlaniBul(int s1,int s2) => s1<s2 ? s2:s1;
int minOlaniBul(int s1, int s2) => s1<s2 ? s1: s2;*/
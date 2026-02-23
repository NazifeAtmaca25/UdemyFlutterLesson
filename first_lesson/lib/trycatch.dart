main(List<String> args){
  print("Program başladı");

  try{
    int sayi=100 ~/int.parse("nazife");
    print(sayi);
  } on UnsupportedError {
    print("Bölen sıfır olamaz");
  } on FormatException catch(e){
    print(e.message);
    print(e.source);
  } catch(e){
    print("Hata çıktı ${e}");
  } finally {
    print("İşlem bitti");
  }

  print("Program bitti");
}
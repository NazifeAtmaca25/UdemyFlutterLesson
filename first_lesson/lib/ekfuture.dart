main(List<String> args){
  print("Program başladı.");
  toplam.then((value)=>print(value));
  print("Program bitti");
  Future.delayed(Duration(seconds: 0),(){
    print("0 saniyelik işlem bitti");
  });



}
Future<int> toplam=Future((){
  int toplam=0;
  for(int i=0;i<10000;i++){
    toplam=toplam+i;
  }
  return toplam;
});
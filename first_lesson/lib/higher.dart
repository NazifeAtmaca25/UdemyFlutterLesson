void main(List<String> args){

  List<int> liste=[1,2,3];
  liste.forEach(callBack);
  
  kendiForechyapim(liste, (int deger, int index){
    print("Değer $deger ve index $index");
  });
}
void kendiForechyapim(List<int> liste, Function callback){
  for(int i=0; i<liste.length; i++){
    callback(liste[i],i);
  }
}
void callBack(int element){
  print("Element $element");
}
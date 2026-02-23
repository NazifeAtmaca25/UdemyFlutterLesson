main(List<String> args){
  double doubleOrtalama=ortamalamaBul<double>(1, 3);
  double intOrtalama=ortamalamaBul<int>(7, 5);
  print("Ortalama $doubleOrtalama");
  print("Ortalama $intOrtalama");
}
double ortamalamaBul<T extends num>(T a, T b){
  return(a+b)/2;
}
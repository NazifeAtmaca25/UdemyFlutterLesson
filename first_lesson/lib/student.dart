import 'dart:math';

void main(List<String> args){

  List<Student> students=[];
  for(int i=1;i<101;i++){
    students.add(Student(i, Random().nextInt(100)));
  }

  for(var ogrenci in students){
    print("Öğrenci id: ${ogrenci.id} ve öğrenci notu: ${ogrenci.not}");
  }

}
class Student{
  int _id=101;
  int _not=0;

  Student(int id, int deger){
    setStudent=id;
    not=deger;
  }




  set not(int value) {
    _not = value;
  }

  void set setStudent(int id){
    if(id>0){
      _id=id;
    } else{
      _id=101;
    }
  }

  int get not => _not;
  int get id => _id;
}
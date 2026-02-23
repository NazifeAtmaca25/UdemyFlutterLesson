class MyStack{
  List _liste=[];
  push(element){
    _liste.add(element);
  }
  pop(){
    return _liste.removeLast();
  }
}

class IntMyStack{
  List<int> _list = <int>[];

  void push(int element){
    _list.add(element);
  }

  int pop(){
    return _list.removeLast();
  }
}
class StringMyStack{
  List<String> _list = <String>[];

  void push(String element){
    _list.add(element);
  }

  String pop(){
    return _list.removeLast();
  }
}
class GenericStack<T>{
  List<T> _list= <T>[];
  void push(T element){
    _list.add(element);
  }
  T pop() {
    return _list.removeLast();
  }
}
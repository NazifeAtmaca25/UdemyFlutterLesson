void main(List<String> args) {
  Map<String, dynamic> map = Map();
  var map2 = <String, dynamic>{};

  map['id'] = 5;
  map['isim'] = 'emre';
  map['renk'] = 'mavi';

  var yeniMap = Map.from({'deger': 'yeni', 'kajd': 'lksadj'});
  print(yeniMap);
  var mapFromEntries=Map.fromEntries(map.entries);
  print(mapFromEntries);

  var liste=<int>[1,2,3,4,5];
  var mapFromIterable=Map.fromIterable(liste,key: (item){
    return "$item";
  }, value: (item)=>"${item*2}");
  //var mapFromIterable={ for (var item in liste) "$item" : "${item*2}" };

  print(mapFromIterable);

  map.update('id_yeni', (value)=>value*3,ifAbsent: ()=>100);
  print(map);

  map.putIfAbsent("soyisim", ()=>"atmaca");
  print(map);
}
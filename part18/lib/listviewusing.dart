import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class Listviewusing extends StatelessWidget {
   Listviewusing({super.key});
  
  List<Ogrenci> tumOgrenciler=List.generate(500, (index)=>Ogrenci(index, 'Ogrenci adı ${index + 1}', 'Ogrenci soyadı ${index + 1}'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Öğrenci Listesi"),
      ),
      body: ListView.separated(
        itemCount: tumOgrenciler.length,
        itemBuilder: (context, index){
          var ogr=tumOgrenciler[index];
        return Card(
          color: index%2==0?Colors.orange.shade200:Colors.purple.shade200,
          child: ListTile(
            onTap: (){
              if(index%2==0){
                EasyLoading.instance.backgroundColor=Colors.red;
                EasyLoading.instance.textColor=Colors.purple;
              }else{
                EasyLoading.instance.backgroundColor=Colors.blue;
              }
              EasyLoading.showToast('Eleman tıklandı',
              duration: Duration(seconds: 3),
              dismissOnTap: true,
              toastPosition: EasyLoadingToastPosition.top);
            },
            onLongPress: (){
              _alertDialogIslemleri(context,ogr);
            },
            title: Text(ogr.name),
            subtitle: Text(ogr.surname),
            leading: CircleAvatar(
              child: Text(ogr.id.toString()),
            ),
          ),
        );
      }, separatorBuilder: (BuildContext context, int index) {
          var yeniIndex=index+1;
          if(yeniIndex%4==0){
            return Divider(
              thickness: 1,
              color: Colors.purple,
            );
          }
          return SizedBox();
      },),
    );
  }

  ListView normalListView() {
    return ListView(
      children: tumOgrenciler.map((Ogrenci ogr)=>ListTile(
        title: Text(ogr.name),
        subtitle: Text(ogr.surname),
        leading: CircleAvatar(
          child: Text(ogr.id.toString()),
        ),
      )).toList(),
    );
  }
}

void _alertDialogIslemleri(BuildContext myContext, Ogrenci secilen){
  showDialog(context: myContext,
      barrierDismissible: false,//ekranın kenarına tıklayıp sayfayı kapatmayı önler.
      builder: (context){
    return AlertDialog(

      title: Text(secilen.toString()),
      content: SingleChildScrollView(
        child: ListBody(
          children: [
            Text('nazife' * 100),
            Text('nazife2' * 100),
          ],
        ),
      ),
      actions: [
        OverflowBar(
          children: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                },
              child: Text('KAPAT'),
            ),
            TextButton(
              onPressed: () {},
              child: Text('TAMAM'),)
          ],
        )
      ],
    );
  });
}
class Ogrenci{
  final int id;
  final String name;
  final String surname;

  Ogrenci(this.id, this.name, this.surname);

  @override
  String toString() {
    return 'Isim : $name Soyisim:$surname id:$id';
  }


}

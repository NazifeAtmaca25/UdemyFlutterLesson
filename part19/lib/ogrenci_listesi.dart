import 'package:flutter/material.dart';

class OgrenciListesi extends StatelessWidget {
  const OgrenciListesi({super.key});

  @override
  Widget build(BuildContext context) {
    int elemanSayisi=ModalRoute.of(context)!.settings.arguments as int ;
    List<Ogrenci> ogrenciListesi=List.generate(elemanSayisi, (index)=>Ogrenci(index+1, "İsim: ${index+1}", "Soyisim: ${index+1}"));
    return Scaffold(
      appBar: AppBar(
        title: Text("Öğrenci listesi"),
      ),
      body: ListView.builder(
          itemCount: elemanSayisi,
          itemBuilder: (context,index){
            return ListTile(
              onTap: (){
                var secilen=ogrenciListesi[index];
                Navigator.pushNamed(context, '/ogrenciDetay',arguments: secilen);

              },
              leading: CircleAvatar(
                child: Text(ogrenciListesi[index].id.toString()),
              ),
              title: Text(ogrenciListesi[index].isim),
              subtitle: Text(ogrenciListesi[index].soyisim),
            );
          }),
    );
  }
}
class Ogrenci{
  final int id;
  final String isim;
  final String soyisim;

  Ogrenci(this.id, this.isim, this.soyisim);
}

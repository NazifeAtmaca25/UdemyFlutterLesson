import 'package:flutter/material.dart';

import '../model/data.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  late List<Data> tumVeriler;

  @override
  void initState() {
    super.initState();
    tumVeriler=[
      Data('Biz Kimiz', false,'Biz kimizin içeriği buraya gelecek'),
      Data('Biz Neredeyiz',false, 'Biz neredeyiz içeriği buraya gelecek'),
      Data('Misyonumuz',false, 'Biz kimizin içeriği buraya gelecek'),
      Data('Vizyonumuz',false, 'Biz kimizin içeriği buraya gelecek'),
      Data('İletişim',false, 'Biz kimizin içeriği buraya gelecek'),
      Data('İletişim',false, 'Biz kimizin içeriği buraya gelecek'),
      Data('İletişim',false, 'Biz kimizin içeriği buraya gelecek'),
      Data('İletişim',false, 'Biz kimizin içeriği buraya gelecek'),
      Data('İletişim',false, 'Biz kimizin içeriği buraya gelecek'),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tumVeriler.length,
        itemBuilder: (context,index){
      return ExpansionTile(
        key: PageStorageKey("$index"),
          title: Text(tumVeriler[index].baslik),
        initiallyExpanded: tumVeriler[index].expand,
        children: [
          Container(
            color: index%2==0?Colors.red.shade200:Colors.yellow.shade200,
            height: 100,
            width: double.infinity,
            child: Padding(padding: EdgeInsets.all(16),
            child: Text(tumVeriler[index].icerik),),
          )
        ],
      
      );
    });
  }
}

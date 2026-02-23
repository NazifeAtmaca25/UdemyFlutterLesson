import 'package:flutter/material.dart';

class Cardandlisttileusing extends StatelessWidget {
  const Cardandlisttileusing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card ve List tile'),
      ),
      body: Center(
        child: ListView(
          reverse: true,
          children: [
            Column(
              children: [
                tekListeElemani(),
                tekListeElemani(),
                tekListeElemani(),
                tekListeElemani(),
                tekListeElemani(),
                tekListeElemani(),
                tekListeElemani(),
                tekListeElemani(),
                tekListeElemani(),
                tekListeElemani(),
                tekListeElemani(),
                tekListeElemani(),
              ],
            ),
            Text("Selam"),
            ElevatedButton(
              onPressed: () {},
              child: Text('Buton'),
            ),
          ],
        ),
      ),
    );
  }

  SingleChildScrollView buildSingleChildScrollView() {
    return SingleChildScrollView(
        child: Column(
          children: [
            tekListeElemani(),
            tekListeElemani(),
            tekListeElemani(),
            tekListeElemani(),
            tekListeElemani(),
            tekListeElemani(),
            tekListeElemani(),
            tekListeElemani(),
            tekListeElemani(),
            tekListeElemani(),
            tekListeElemani(),
            tekListeElemani(),
          ],
        ),
      );
  }

  Column tekListeElemani() {
    return Column(
        children: [
          Card(
            color: Colors.blue.shade200,
            shadowColor: Colors.black26,
            elevation: 12,
            shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(10)),
            child: ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.add),
              ),
              title: Text("Başlık Kısmı"),
              subtitle: Text("Alt Başlık Kısmı"),
              trailing: Icon(Icons.real_estate_agent),
            ),
          ),
          Divider(
            color: Colors.purple,
            thickness: 1,
            height: 10,
            indent: 60,//dividerın baş kısmı ile ekran arasındaki boşluk
            endIndent: 60,//son kısmı ile ekran arasındaki mesafe
          )
        ],
      );
  }
}

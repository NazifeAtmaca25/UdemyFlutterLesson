import 'package:flutter/material.dart';

class DrawerInkwellUsing extends StatefulWidget {
  const DrawerInkwellUsing({super.key});

  @override
  State<DrawerInkwellUsing> createState() => _DrawerInkwellUsingState();
}

class _DrawerInkwellUsingState extends State<DrawerInkwellUsing> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
              accountName: Text("Nazife Atmaca"),
              accountEmail: Text("nazifeatmaca@gmail.com"),
            currentAccountPicture: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRNKfj6RsyRZqO4nnWkPFrYMmgrzDmyG31pFQ&s"),
            otherAccountsPictures: [
              CircleAvatar(
                backgroundColor: Colors.green,
                child: Text("DT"),
              ),
              CircleAvatar(
                backgroundColor: Colors.brown,
                child: Text("ÖA"),
              )
            ],
            decoration: BoxDecoration(
              color: Colors.pink
            ),
            currentAccountPictureSize: Size(75, 75),
          ),
          Expanded(child: ListView(
            children: [
              ListTile(
                leading: Icon(Icons.home),
                title: Text("Anasayfa"),
                trailing: Icon(Icons.chevron_right),
              ),
              ListTile(
                leading: Icon(Icons.call),
                title: Text("Ara"),
                trailing: Icon(Icons.chevron_right),
              ),
              ListTile(
                leading: Icon(Icons.account_box_outlined),
                title: Text("Profil"),
                trailing: Icon(Icons.chevron_right),
              ),
              Divider(),
              InkWell(
                onTap: (){},
                splashColor: Colors.blue,
                child: ListTile(
                  leading: Icon(Icons.home),
                  title: Text("Ara"),
                  trailing: Icon(Icons.chevron_right),
                ),
              ),
              AboutListTile(
                applicationName: 'Flutter Dersleri',
                applicationIcon: Icon(Icons.save),
                applicationVersion: '3.0',
                child: Text('ABOUT US'),
                applicationLegalese: 'Hakkımızda ',
                icon: Icon(Icons.keyboard),
                aboutBoxChildren: <Widget>[
                  Text('Child 1'),
                  Text('Child 2'),
                  Text('Child 3'),
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}

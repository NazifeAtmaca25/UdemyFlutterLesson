import 'dart:math';

import 'package:flutter/material.dart';

class Customscrollandslivers extends StatelessWidget {
  const Customscrollandslivers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            floating: false,
            pinned: true,
            snap: false,
            //title: Text("Sliver App Bar"),
            backgroundColor: Colors.pink,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Sliver App Bar"),
              centerTitle: true,
              background: Image.asset(
                "assets/images/nazife.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          
          SliverGrid(delegate: SliverChildListDelegate(sabitListe()), gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2)),
          SliverGrid(delegate: SliverChildBuilderDelegate(dinamikListe,childCount: 6), gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3)),
          SliverGrid(delegate: SliverChildListDelegate(sabitListe()), gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200)),
          SliverGrid(delegate: SliverChildBuilderDelegate(dinamikListe,childCount: 6), gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 100)),
          SliverPadding(
            padding: EdgeInsets.all(4),
            sliver: SliverList(delegate: SliverChildListDelegate(sabitListe())),
          ),

          SliverPadding(
            padding: EdgeInsets.all(8),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(dinamikListe,childCount: 6),
            ),
          ),

          SliverFixedExtentList(delegate: SliverChildListDelegate(sabitListe()), itemExtent: 100),
          SliverFixedExtentList(delegate: SliverChildBuilderDelegate(dinamikListe,childCount: 6), itemExtent: 50)
        ],
      ),
    );
  }

  Widget dinamikListe(
            BuildContext context,
            int index,
          ) {
            return Container(
              height: 100,
              color: rastgeleRenk(),
              alignment: Alignment.center,
              child: Text(
                "Dinamik Liste Elemanı ${index + 1}",
                style: TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
            );
          }

  List<Widget> sabitListe() {
    return [
      Container(
        height: 100,
        color: Colors.amber,
        alignment: Alignment.center,
        child: Text(
          "Sabit Liste Elemanı 1",
          style: TextStyle(fontSize: 24),
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        height: 100,
        color: Colors.teal,
        alignment: Alignment.center,
        child: Text(
          "Sabit Liste Elemanı 2",
          style: TextStyle(fontSize: 24),
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        height: 100,
        color: Colors.blue,
        alignment: Alignment.center,
        child: Text(
          "Sabit Liste Elemanı 3",
          style: TextStyle(fontSize: 24),
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        height: 100,
        color: Colors.orange,
        alignment: Alignment.center,
        child: Text(
          "Sabit Liste Elemanı 4",
          style: TextStyle(fontSize: 24),
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        height: 100,
        color: Colors.pinkAccent,
        alignment: Alignment.center,
        child: Text(
          "Sabit Liste Elemanı 5",
          style: TextStyle(fontSize: 24),
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        height: 100,
        color: Colors.purple,
        alignment: Alignment.center,
        child: Text(
          "Sabit Liste Elemanı 6",
          style: TextStyle(fontSize: 24),
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        height: 100,
        color: Colors.amber,
        alignment: Alignment.center,
        child: Text(
          "Sabit Liste Elemanı 1",
          style: TextStyle(fontSize: 24),
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        height: 100,
        color: Colors.teal,
        alignment: Alignment.center,
        child: Text(
          "Sabit Liste Elemanı 2",
          style: TextStyle(fontSize: 24),
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        height: 100,
        color: Colors.blue,
        alignment: Alignment.center,
        child: Text(
          "Sabit Liste Elemanı 3",
          style: TextStyle(fontSize: 24),
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        height: 100,
        color: Colors.orange,
        alignment: Alignment.center,
        child: Text(
          "Sabit Liste Elemanı 4",
          style: TextStyle(fontSize: 24),
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        height: 100,
        color: Colors.pinkAccent,
        alignment: Alignment.center,
        child: Text(
          "Sabit Liste Elemanı 5",
          style: TextStyle(fontSize: 24),
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        height: 100,
        color: Colors.purple,
        alignment: Alignment.center,
        child: Text(
          "Sabit Liste Elemanı 6",
          style: TextStyle(fontSize: 24),
          textAlign: TextAlign.center,
        ),
      ),
    ];
  }

  Color rastgeleRenk() {
    return Color.fromRGBO(
      Random().nextInt(255),
      Random().nextInt(255),
      Random().nextInt(255),
      Random().nextDouble(),
    );
  }
}

import 'package:flutter/material.dart';

class Arama extends StatefulWidget {
  const Arama({super.key});

  @override
  State<Arama> createState() => _AramaState();
}

class _AramaState extends State<Arama> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 300,
        itemBuilder: (context,index){
      return Container(
        height: 100,
        padding: EdgeInsets.all(10),
        child: Material(
          elevation: 4,
          borderRadius: BorderRadius.circular(10),
          color: index % 2 == 0 ?Colors.orangeAccent.shade200 : Colors.indigo.shade200,
          child: Center(child: Text(index.toString()),),
        ),
      );
    });
  }
}

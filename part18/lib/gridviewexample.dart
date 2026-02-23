import 'package:flutter/material.dart';

class Gridviewexample extends StatelessWidget {
  const Gridviewexample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gridview Örnek"),
      ),
      body: GridView.builder(
        itemCount: 100,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
          itemBuilder: (BuildContext context, int index){
            return GestureDetector(
              onTap: ()=>debugPrint("Kısa $index tıklandı"),
              onLongPress: ()=>debugPrint("Uzun $index tıklandı"),
              onDoubleTap: ()=>debugPrint("Çift $index tıkladı"),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.orange,width: 5),
                    gradient: LinearGradient(colors: [Colors.yellow,Colors.red],begin: Alignment.topCenter,end: Alignment.bottomCenter),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.red,
                          offset: Offset(10, 5),
                          blurRadius: 15
                      )
                    ],
                    //borderRadius: BorderRadius.all(Radius.circular(10))
                    shape: BoxShape.circle
                ),
                margin: EdgeInsets.all(20),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Merhaba flutter $index", textAlign: TextAlign.center,),
                ),
              ),
            );
          }),
    );
  }
}

/*
* GridView.extent(
        reverse: true,
        primary: true,
        crossAxisSpacing: 20,
        mainAxisSpacing: 40,
        maxCrossAxisExtent: 700,
        children: [
          Container(
            alignment: Alignment.center,
            color: Colors.teal.shade300,
            child: Text("Merhaba flutter 2", textAlign: TextAlign.center,),
          ),
          Container(
            alignment: Alignment.center,
            color: Colors.teal.shade300,
            child: Text("Merhaba flutter 3", textAlign: TextAlign.center,),
          ),
          Container(
            alignment: Alignment.center,
            color: Colors.teal.shade300,
            child: Text("Merhaba flutter 3", textAlign: TextAlign.center,),
          ),
          Container(
            alignment: Alignment.center,
            color: Colors.teal.shade300,
            child: Text("Merhaba flutter 4", textAlign: TextAlign.center,),
          ),
          Container(
            alignment: Alignment.center,
            color: Colors.teal.shade300,
            child: Text("Merhaba flutter 5", textAlign: TextAlign.center,),
          ),
          Container(
            alignment: Alignment.center,
            color: Colors.teal.shade300,
            child: Text("Merhaba flutter 6", textAlign: TextAlign.center,),
          ),
        ],
      )*/

/*
* GridView.count(
        reverse: true,
        crossAxisCount: 3,
        primary: true,
        crossAxisSpacing: 20,
        mainAxisSpacing: 40,
        children: [
          Container(
            alignment: Alignment.center,
            color: Colors.teal.shade300,
            child: Text("Merhaba flutter 2", textAlign: TextAlign.center,),
          ),
          Container(
            alignment: Alignment.center,
            color: Colors.teal.shade300,
            child: Text("Merhaba flutter 3", textAlign: TextAlign.center,),
          ),
          Container(
            alignment: Alignment.center,
            color: Colors.teal.shade300,
            child: Text("Merhaba flutter 3", textAlign: TextAlign.center,),
          ),
          Container(
            alignment: Alignment.center,
            color: Colors.teal.shade300,
            child: Text("Merhaba flutter 4", textAlign: TextAlign.center,),
          ),
          Container(
            alignment: Alignment.center,
            color: Colors.teal.shade300,
            child: Text("Merhaba flutter 5", textAlign: TextAlign.center,),
          ),
          Container(
            alignment: Alignment.center,
            color: Colors.teal.shade300,
            child: Text("Merhaba flutter 6", textAlign: TextAlign.center,),
          ),
        ],
      ),*/
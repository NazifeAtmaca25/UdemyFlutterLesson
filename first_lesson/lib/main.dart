import 'package:first_lesson/button.dart';
import 'package:first_lesson/image.dart';
import 'package:first_lesson/popup.dart';
import 'package:flutter/material.dart';

import 'dropdown.dart';

void main(){
 runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    String _img='https://res.cloudinary.com/tasit-com/images/c_scale,w_448,h_249,dpr_2/f_webp,q_auto/v1689797829/carvak_blog_wordpress_assest/fransiz-araba/fransiz-araba.jpg?_i=AA';
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue,),
      home: Popup(),
    );
  }

  Scaffold buildScaffold() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title:Text("Merhaba dünya") ,
      ),
      body: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: flexibleChild,
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        debugPrint("Tıklandı");
      },
      backgroundColor: Colors.green,
      child: Icon(Icons.add,color: Colors.pink,),),
    );
  }

  List<Widget> get flexibleChild {
    return [
      Flexible(
        flex: 9,
        child: Container(
          width: 150,
          height: 300,
          color: Colors.yellow,
        ),
      ),
      Flexible(
        flex: 1,
        child: Container(
          width: 150,
          height: 300,
          color: Colors.red,
        ),
      ),

    ];
  }
  List<Widget> get expendedChild {
    return [
      Expanded(
        flex: 2,
        child: Container(
          width: 75,
          height: 75,
          color: Colors.yellow,
        ),
      ),
      Expanded(
        flex: 1,
        child: Container(
          width: 75,
          height: 75,
          color: Colors.red,
        ),
      ),
      Expanded(
        flex: 1,
        child: Container(
          width: 75,
          height: 75,
          color: Colors.blue,
        ),
      ),
      Expanded(
        child: Container(
          width: 75,
          height: 75,
          color: Colors.orange,
        ),
      ),

    ];
  }
  List<Widget> get sorunluChild {
    return [
            Container(
              width: 75,
              height: 75,
              color: Colors.yellow,
            ),
            Container(
              width: 75,
              height: 75,
              color: Colors.red,
            ),
            Container(
              width: 75,
              height: 75,
              color: Colors.blue,
            ),
            Container(
              width: 75,
              height: 75,
              color: Colors.orange,
            ),
            Container(
              width: 75,
              height: 75,
              color: Colors.blue,
            ),
            Container(
              width: 75,
              height: 75,
              color: Colors.red,
            ),
          ];
  }

  Widget columnDersi() {
    return Container(
        color: Colors.red.shade200,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.add_circle,size: 64,color:Colors.purple,),
            Icon(Icons.add_circle,size: 64,color:Colors.orange,),
            Icon(Icons.add_circle,size: 64,color:Colors.green,),
            Icon(Icons.add_circle,size: 64,color:Colors.black,)

          ],
        ),
      );
  }

  Widget buildCenter(String _img) {
    return Center(
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.orange,
            shape: BoxShape.rectangle,
            border: Border.all(color: Colors.purple,width: 4),
            //borderRadius: BorderRadius.circular(30)
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),topRight: Radius.circular(30)),
            image: DecorationImage(image: NetworkImage(_img),fit: BoxFit.cover),
            boxShadow: [
              BoxShadow(color: Colors.green,offset: Offset(10,10),blurRadius: 10)
            ]
          ),

          child: Text("Nazife",style: TextStyle(fontSize: 64),),
        )
      );
  }
  
}
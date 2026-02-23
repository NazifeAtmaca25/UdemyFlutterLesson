import 'dart:math';

import 'package:flutter/material.dart';

class RedPage extends StatelessWidget {
  RedPage({super.key});
  int _rastgeleSayi=0;
  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop,result){
        if(didPop){
          return;
        }
          print("popScope çalıştı");
          if(_rastgeleSayi==0){
            _rastgeleSayi = Random().nextInt(100);
            Navigator.pop(context, _rastgeleSayi);
          }
        }
      ,
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Red Page"),
          //automaticallyImplyLeading: false,
        ),
        body: Center(
          child: Column(
            children: [
              Text("Kırmızı sayfa",style: TextStyle(fontSize: 24),),
              ElevatedButton(onPressed: (){
                _rastgeleSayi=Random().nextInt(100);
                print("Rastgele sayı $_rastgeleSayi");
                //Navigator.pop(context,_rastgeleSayi);
                Navigator.of(context).pop<int>(_rastgeleSayi);
              }, child: Text("Geri Dön")),

              ElevatedButton(onPressed: (){
                if(Navigator.of(context).canPop()){
                  print("Pop edilebilir");
                }else{
                  print("Pop edilemez");
                }
              }, child: Text("Can pop kullanımı")),
              ElevatedButton(onPressed: (){
                Navigator.of(context).maybePop();
              }, child: Text("Maybe pop kullanımı")),
            ],
          ),
        ),
      ),
    );
  }
}
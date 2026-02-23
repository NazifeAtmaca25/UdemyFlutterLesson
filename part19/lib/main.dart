import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:part19/orange_page.dart';
import 'package:part19/red_page.dart';
import 'package:part19/route_generator.dart';
import 'package:part19/yellow_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
     // home: AnaSayfa(),
      /*routes: {
        '/redPage': (context)=>RedPage(),
        '/':(context)=>AnaSayfa(),
        '/orangePage':(context)=>OrangePage(),
        '/yellowPage':(context)=>YellowPage()
      },
      onUnknownRoute: (setting)=>MaterialPageRoute(builder: (context)=>Scaffold(
        appBar: AppBar(title: Text("Error"),),
        body: Center(child: Text("Hatalı Sayfa"),),
      )),*/
      onGenerateRoute: RouteGenerator.routeGenerator,
    );
  }
}

class AnaSayfa extends StatelessWidget {
  const AnaSayfa({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigation İşlemleri"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: () async{
             int? gelenSayi=await Navigator.of(context).push<int>(CupertinoPageRoute(builder: (redContext)=>RedPage()));
             print("Gelen sayı:$gelenSayi");
            },style: ElevatedButton.styleFrom(backgroundColor: Colors.red.shade400), child: Text("Kırmızı sayfaya git IOS"),),
            SizedBox(height: 15,),
            ElevatedButton(onPressed: (){
              //Navigator.push(context, MaterialPageRoute(builder: (redContext)=>RedPage()));
              Navigator.of(context).push<int>(MaterialPageRoute(builder: (redContext)=>RedPage())).then((int? value){
                print("Gelen sayı android: $value");
              });
            },style: ElevatedButton.styleFrom(backgroundColor: Colors.red), child: Text("Kırmızı sayfaya git Android"),),
            ElevatedButton(onPressed: (){
              Navigator.of(context).maybePop();
            }, child: Text("Maybe pop kullanımı")),
            ElevatedButton(onPressed: (){
              if(Navigator.of(context).canPop()){
                print("Pop edilebilir");
              }else{
                print("Pop edilemez");
              }
            }, child: Text("Can pop kullanımı")),
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, '/yellowPage');
            },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow.shade300),
                child: Text("PushNamed Kullanımı")),
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, '/orsangePage');
            },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange.shade300),
                child: Text("PushNamed Kullanımı")),
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, '/redPage');
            },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red.shade300),
                child: Text("PushNamed Kullanımı")),

            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, '/ogrenciListesi',arguments: 80);
            },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.pink.shade300),
                child: Text("PushNamed Kullanımı")),

          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:part23_tasarim_yapilari/page/anasayfa.dart';
import 'package:part23_tasarim_yapilari/page/arama.dart';
import 'package:part23_tasarim_yapilari/page/custom_font_using.dart';
import 'package:part23_tasarim_yapilari/page/drawer_inkwell_using.dart';
import 'package:part23_tasarim_yapilari/page/page_view_example.dart';

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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "FontBir",
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int secilenSayfa=0;
  late List<Widget> sayfalar;
  late Anasayfa anasayfa;
  late Arama arama;
  late PageViewExample pageViewExample;

  var keyAnasayfa=PageStorageKey('key_ana_sayfa');
  var keyArama=PageStorageKey('key_ana_sayfa');
  var keyPage=PageStorageKey('key_ana_sayfa');

  @override
  void initState() {
    super.initState();
    anasayfa=Anasayfa(key: keyAnasayfa,);
    arama=Arama(key: keyArama,);
    pageViewExample=PageViewExample(key: keyPage,);
    sayfalar=[anasayfa,arama,pageViewExample];

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drawer Kullanımı"),
      ),
      drawer: DrawerInkwellUsing(),
      body: secilenSayfa<=sayfalar.length-1 ? sayfalar[secilenSayfa]:sayfalar[0],
      bottomNavigationBar: Theme(

        data: ThemeData(
          canvasColor: Colors.cyan.shade100,
          primaryColor: Colors.orangeAccent
        ),
        child: BottomNavigationBar(items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),
          label: "ExpansionTile",
          backgroundColor: Colors.amber
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search),
              activeIcon: Icon(Icons.call),
              label: "Liste",
              backgroundColor: Colors.red
          ),
          BottomNavigationBarItem(icon: Icon(Icons.add),
              label: "PageView",
              backgroundColor: Colors.teal
          ),
          BottomNavigationBarItem(icon: Icon(Icons.account_box),
              label: "Profile",
              backgroundColor: Colors.brown
          ),
        ],
        type: BottomNavigationBarType.shifting,
        currentIndex: secilenSayfa,
        onTap: (index){
          setState(() {
            secilenSayfa=index;
          });
        },),
      ),
    );
  }
}


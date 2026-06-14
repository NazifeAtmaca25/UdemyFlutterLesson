import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:part27_hive_depolama2/model/ogrenci.dart';
//flutter packages pub run build_runner build
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter("uygulama");
  //encryted
  FlutterSecureStorage secureStorage=const FlutterSecureStorage();
  var containsEncryptionKey= await secureStorage.containsKey(key: 'key');
  if(!containsEncryptionKey){
    var key=Hive.generateSecureKey();
    await secureStorage.write(key: 'key', value: base64UrlEncode(key));
  }

  var encryptionKey=base64Url.decode(await secureStorage.read(key: 'key') ?? 'nazife'); //burada anahtarın ne olduğunu öğreniyoruzki boxı açabilelim
  print("Encryption key: $encryptionKey");

  var sifreliKutu= await Hive.openBox("ozel", encryptionCipher: HiveAesCipher(encryptionKey)); //"Bu kutunun içine ne atarsam atayım, kasadan aldığım bu özel anahtarla şifrele"
  await sifreliKutu.put('secret', 'Hive is cool');
  await sifreliKutu.put('sifre','1234');

  print(sifreliKutu.get('secret'));
  print(sifreliKutu.get('sifre'));

  await Hive.openBox("test");

  Hive.registerAdapter(OgrenciAdapter());
  Hive.registerAdapter(GozRenkAdapter());
  await Hive.openBox<Ogrenci>("ogrenciler");

  await Hive.openLazyBox<int>("sayilar");
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  Future<void> _incrementCounter() async {
    var box=Hive.box("test");
    await box.clear(); //uygulamayı her açtığımızda önceki veriler kayıtlı kaldığı için onları temizlemek için clear kullanıyoruz

    box.add("nazife");//index 0 key 0 value nazife
    box.add("atmaca");
    box.add(true);
    box.add(123); // index 3 key 3 value 123
    //await box.addAll(["liste1","liste2",false,2938]);// addAll da await kullan
    //add de key değeri vermezken putta veriyoruz.
    await box.put("tc", "13231321321");
    await box.put("tema", "dark");
    /*await box.putAll({
      'araba':'mercedes',
      'yıl':2020
    });*/

    /*box.values.forEach((element){
      debugPrint(element.toString());
    });*/

    debugPrint(box.toMap().toString()); //Returns a map which contains all key - value pairs of the box
    debugPrint(box.get("tema")); //key ile çalışır.
    debugPrint(box.get("tc"));
    debugPrint(box.get(0));
    debugPrint(box.getAt(0));//index ile çalışır.
    debugPrint(box.getAt(4));
    debugPrint(box.length.toString());

    await box.delete("tema");//delete await bir işlemdir.
    await box.deleteAt(0);
    debugPrint(box.toMap().toString());

    await box.putAt(0, "yeni değer"); //indexe göre değeri değiştirir.
    debugPrint(box.toMap().toString());


  }

  Future<void> _customData() async{
    var emre=Ogrenci(1, "emre", GozRenk.BLUE);
    var nazife=Ogrenci(2, "nazife", GozRenk.BLACK);

    var box=Hive.box<Ogrenci>("ogrenciler");
    box.clear();
    box.add(emre);
    box.add(nazife);

    box.put("emre", emre);
    box.put("nazife", nazife);

    debugPrint(box.toMap().toString());

  }

  Future<void> _lazyAndEncrytedBox() async{
    var sayilar=Hive.lazyBox<int>("sayilar");
    for(int i =0;i<50;i++){
      await sayilar.add(i*50);
    }

    for(int i=0;i<50;i++){
      debugPrint((await sayilar.getAt(i)).toString());
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _lazyAndEncrytedBox,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

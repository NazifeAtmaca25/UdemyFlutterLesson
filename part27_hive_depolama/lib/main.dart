import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:part27_hive_depolama/services/file_storage.dart';
import 'package:part27_hive_depolama/services/local_storage_services.dart';
import 'package:part27_hive_depolama/services/secure_storage_services.dart';
import 'package:part27_hive_depolama/services/shared_pref_services.dart';
import 'package:part27_hive_depolama/shared_pref_using.dart';

final locator = GetIt.instance;

void setUp() {
  locator.registerSingleton<LocalStorageServices>(FileStorage());
  //registerSingleton: bir nesneyi bir kere üretiyor ve ondan sonra kullanılacağı zaman bir daha bir daha
  //contructorı çalıştırılmıyor aynı nesne üzerinden üretiliyor.

  locator.registerLazySingleton<LocalStorageServices>(
    () => SecureStorageServices(),
  );
  //uygulama başlar başlamaz üretmede ihtiyat duyulduğunda
}

void main() {
  setUp();
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
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: SharedPrefUsing(),
    );
  }
}

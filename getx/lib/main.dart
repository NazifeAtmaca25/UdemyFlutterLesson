import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/route/page_route.dart';
import 'package:getx/screens/favorite_page.dart';
import 'package:getx/screens/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      initialRoute: '/',
      getPages: RoutePage.routes,
    );
  }
}

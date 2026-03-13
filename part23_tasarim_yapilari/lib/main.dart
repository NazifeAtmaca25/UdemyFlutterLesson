import 'package:flutter/material.dart';
import 'package:part23_tasarim_yapilari/custom_font_using.dart';

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
      home: CustomFontUsing(),
    );
  }
}

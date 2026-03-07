import 'package:flutter/material.dart';
import 'package:part21_input_widgets/date_and_time.dart';
import 'package:part21_input_widgets/diger_form_elemanlari.dart';
import 'package:part21_input_widgets/global_key_using.dart';
import 'package:part21_input_widgets/text_field_kullanimi.dart';
import 'package:part21_input_widgets/text_form_field.dart';

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
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),

      ),
      home: DateAndTime(),
    );
  }
}

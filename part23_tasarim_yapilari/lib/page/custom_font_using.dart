import 'package:flutter/material.dart';

class CustomFontUsing extends StatelessWidget {
  const CustomFontUsing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Custom Font Kullanımı"),
      ),
      body: Column(
        children: [
          Center(
            child: Text("Kişisel Font Kullanımı", style: TextStyle(fontFamily: "FontBir",fontSize: 24),),
          ),
          Center(
            child: Text("Kişisel Font Kullanımı", style: TextStyle(fontFamily: "FontIki",fontSize: 24,fontWeight: FontWeight.w100),),
          ),
          Center(
            child: Text("Kişisel Font Kullanımı", style: TextStyle(fontFamily: "FontIki",fontSize: 24,fontWeight: FontWeight.w500),),
          ),
          Center(
            child: Text("Kişisel Font Kullanımı", style: TextStyle(fontSize: 24),),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:part21_input_widgets/sayac_widget.dart';

class GlobalKeyUsing extends StatelessWidget {
  GlobalKeyUsing({super.key});
  final sayacWidgetKey=GlobalKey<SayacWidgetState>();

  @override
  Widget build(BuildContext context) {
    print("1");
    return Scaffold(
      appBar: AppBar(
        title: Text("Global Key Kullanımı"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("Buton basılma miktarı"),
            SayacWidget(key: sayacWidgetKey,),
            Text(sayacWidgetKey.currentState?.sayac.toString() ?? '0')
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        sayacWidgetKey.currentState!.arttir();
      },
      child: Icon(Icons.add),),
    );
  }
}

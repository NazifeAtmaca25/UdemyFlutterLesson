import 'package:flutter/material.dart';

class DigerFormElemanlari extends StatefulWidget {
  const DigerFormElemanlari({super.key});

  @override
  State<DigerFormElemanlari> createState() => _DigerFormElemanlariState();
}

class _DigerFormElemanlariState extends State<DigerFormElemanlari> {
  bool checkBoxState = false;
  String city = "";
  bool switchState=false;
  double sliderValue=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Diğer Form Elemanları")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            CheckboxListTile(
              value: checkBoxState,
              onChanged: (secildi) {
                setState(() {
                  checkBoxState = secildi!;
                });
              },
              activeColor: Colors.orange,
              title: Text("CheckBox Title"),
              subtitle: Text("Checkbox Subtitle"),
              secondary: Icon(Icons.check),
              selected: true,
            ),
            RadioGroup(
              onChanged: (String? value) {
                setState(() {
                  city = value!;
                  debugPrint("Secilen değer : $value");
                });
              },
              groupValue: city,
              child: Column(
                children: [
                  RadioListTile(value: "Ankara",title: Text("Ankara"),subtitle: Text("Radio Subtitle"),secondary: Icon(Icons.map_outlined),activeColor: Colors.orange,),
                  RadioListTile(value: "İzmir",title: Text("İzmir"),subtitle: Text("Radio Subtitle"),secondary: Icon(Icons.map_outlined),activeColor: Colors.orange,),
                  RadioListTile(value: "Eskişehir",title: Text("Eskişehir"),subtitle: Text("Radio Subtitle"),secondary: Icon(Icons.map_outlined),activeColor: Colors.orange),
                  RadioListTile(value: "Denizli",title: Text("Denizli"),subtitle: Text("Radio Subtitle"),secondary: Icon(Icons.map_outlined),activeColor: Colors.orange)
                ],
              ),
            ),
            SwitchListTile(
                value: switchState,
                onChanged: (value){
                  setState(() {
                    debugPrint("Anlasma onaylandı : $value");
                    switchState = value;
                  });
                },
            title: Text("Switch Tittle"),
            subtitle:Text("Switch Subtittle"),
            secondary: Icon(Icons.refresh),
            activeThumbColor:Colors.orange ,
            ),
            SizedBox(height: 10,),
            Text("Değeri sliderden seciniz"),
            Slider(value: sliderValue, onChanged: (newValue){
              setState(() {
                sliderValue=newValue;
              });
            },
            min: 0,
            max: 10,
            divisions: 10,
            label: sliderValue.toString(),
            activeColor: Colors.orange,)
          ],
        ),
      ),
    );
  }
}

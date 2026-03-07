import 'package:flutter/material.dart';

class DigerFormElemanlari extends StatefulWidget {
  const DigerFormElemanlari({super.key});

  @override
  State<DigerFormElemanlari> createState() => _DigerFormElemanlariState();
}

class _DigerFormElemanlariState extends State<DigerFormElemanlari> {
  bool checkBoxState = false;
  String city = "";
  bool switchState = false;
  double sliderValue = 0;
  String secilenRenk = "Kırmızı";
  List<String> cities=["Ankara","İstanbul","Eskişehir","Denizli","İzmir"];
  String secilenSehir="Ankara";

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
                  RadioListTile(
                    value: "Ankara",
                    title: Text("Ankara"),
                    subtitle: Text("Radio Subtitle"),
                    secondary: Icon(Icons.map_outlined),
                    activeColor: Colors.orange,
                  ),
                  RadioListTile(
                    value: "İzmir",
                    title: Text("İzmir"),
                    subtitle: Text("Radio Subtitle"),
                    secondary: Icon(Icons.map_outlined),
                    activeColor: Colors.orange,
                  ),
                  RadioListTile(
                    value: "Eskişehir",
                    title: Text("Eskişehir"),
                    subtitle: Text("Radio Subtitle"),
                    secondary: Icon(Icons.map_outlined),
                    activeColor: Colors.orange,
                  ),
                  RadioListTile(
                    value: "Denizli",
                    title: Text("Denizli"),
                    subtitle: Text("Radio Subtitle"),
                    secondary: Icon(Icons.map_outlined),
                    activeColor: Colors.orange,
                  ),
                ],
              ),
            ),
            SwitchListTile(
              value: switchState,
              onChanged: (value) {
                setState(() {
                  debugPrint("Anlasma onaylandı : $value");
                  switchState = value;
                });
              },
              title: Text("Switch Tittle"),
              subtitle: Text("Switch Subtittle"),
              secondary: Icon(Icons.refresh),
              activeThumbColor: Colors.orange,
            ),
            SizedBox(height: 10),
            Text("Değeri sliderden seciniz"),
            Slider(
              value: sliderValue,
              onChanged: (newValue) {
                setState(() {
                  sliderValue = newValue;
                });
              },
              min: 0,
              max: 10,
              divisions: 10,
              label: sliderValue.toString(),
              activeColor: Colors.orange,
            ),

            DropdownButton(
              items: [
                DropdownMenuItem(
                  value: "Kırmızı",
                  child: Row(
                    children: [
                      Container(
                        width: 25,
                        height: 25,
                        color: Colors.red,
                        margin: EdgeInsets.only(right: 10),
                      ),
                      Text("Kırmızı"),
                    ],
                  ),
                ),
                DropdownMenuItem(
                  value: "Mavi",
                  child: Row(
                    children: [
                      Container(
                        width: 25,
                        height: 25,
                        color: Colors.blue,
                        margin: EdgeInsets.only(right: 10),
                      ),
                      Text("Mavi"),
                    ],
                  ),
                ),
                DropdownMenuItem(
                  value: "Yeşil",
                  child: Row(
                    children: [
                      Container(
                        width: 25,
                        height: 25,
                        color: Colors.green,
                        margin: EdgeInsets.only(right: 10),
                      ),
                      Text("Yeşil"),
                    ],
                  ),
                ),
                DropdownMenuItem(
                  value: "Sarı",
                  child: Row(
                    children: [
                      Container(
                        width: 25,
                        height: 25,
                        color: Colors.yellow,
                        margin: EdgeInsets.only(right: 10),
                      ),
                      Text("Sarı"),
                    ],
                  ),
                ),
              ],
              onChanged: (String? secilen) {
                setState(() {
                  secilenRenk = secilen!;
                });
              },
              value: secilenRenk,
              hint: Text("Renk Seçiniz"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Şehir Seçiniz:",style: TextStyle(fontSize: 16),),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                      color: Colors.white, borderRadius: BorderRadius.circular(10)),
                  child: DropdownButton(
                      items: cities.map((sehir)=>DropdownMenuItem(value: sehir,child: Text(sehir),)).toList(),
                      onChanged: (String? c){
                        setState(() {
                          secilenSehir=c!;
                        });
                      },
                    hint: Text("Sehir Seçiniz"),
                    value: secilenSehir,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

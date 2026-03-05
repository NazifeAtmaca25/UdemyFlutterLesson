import 'package:flutter/material.dart';

class TextFormFieldKullanimi extends StatefulWidget {
  const TextFormFieldKullanimi({super.key});

  @override
  State<TextFormFieldKullanimi> createState() => _TextFormFieldKullanimiState();
}

class _TextFormFieldKullanimiState extends State<TextFormFieldKullanimi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form İşlemleri"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              autofocus: true,
              maxLines: 2,
              maxLength: 50,
              onChanged: (String deger){//submit yamadan direk forma yazarken okur yazılanları
                //print(deger);
              },
              onSubmitted: (String deger){
                print("*************************");
                print(deger);
              },
              cursorColor: Colors.red,
              decoration: InputDecoration(
                labelText: "Label text",
                hintText: "Hint Text",
                icon: Icon(Icons.ac_unit_outlined,color: Colors.pink,),
                suffixIcon: Icon(Icons.message,color: Colors.purple,),
                prefixIcon: Icon(Icons.mail_lock_outlined),
                  filled: true,
                //fillColor: Colors.amberAccent,
                border: OutlineInputBorder( //tıkladığında
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.pinkAccent)
                ),
                enabledBorder: OutlineInputBorder(//tıkllanmadığında
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.orange)
                ),
                  focusedBorder: OutlineInputBorder( //tıkladığında
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.pinkAccent)
                  )
              ),

            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,

            ),
          )
        ],
      ),
    );
  }
}

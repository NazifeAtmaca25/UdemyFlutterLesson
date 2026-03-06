import 'package:flutter/material.dart';

class TextFieldKullanimi extends StatefulWidget {
  const TextFieldKullanimi({super.key});

  @override
  State<TextFieldKullanimi> createState() => _TextFieldKullanimiState();
}

class _TextFieldKullanimiState extends State<TextFieldKullanimi> {
  late TextEditingController _controller;
  late FocusNode _focusNode;//kullanıcının o anki odağını yönetir
  int maxLine=1;

  @override
  void initState() {
    super.initState();
    _controller=TextEditingController(text: "nazife@gmail.com");
    _focusNode=FocusNode();
    _focusNode.addListener((){
      setState(() {
        if(_focusNode.hasFocus){
          maxLine=3;
        }else{
          maxLine=1;
        }
      });
    });
  }
  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }
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
              controller: _controller,
              focusNode: _focusNode,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              autofocus: true,
              maxLines: maxLine,
              maxLength: 50,
              onChanged: (String deger){//submit yamadan direk forma yazarken okur yazılanları
                //print(deger);
                if(deger.length>3){
                  setState(() {
                    _controller.value= TextEditingValue(
                        text: deger,
                        selection: TextSelection.collapsed(offset: -1)//yazının nereden başlayacağını gösterir o satırda
                    );
                  });
                }
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
            child: Text(_controller.text),
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
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            _controller.text="atmaca@gmail.com";
          });
        },
      child: Icon(Icons.edit),),
    );
  }
}

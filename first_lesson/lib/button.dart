import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  const Button({super.key});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Butonlar"),
      ),
      body: Column(
        children: [
          TextButton(onPressed: (){},
              style: TextButton.styleFrom(
                backgroundColor: Colors.red
              ),
              child: Text("Text butonu")),
          TextButton.icon(onPressed: (){} ,style: ButtonStyle(
            backgroundColor: WidgetStateProperty.resolveWith((state){
              if(state.contains(WidgetState.pressed)){
                return Colors.teal;
              }
              if(state.contains(WidgetState.hovered)){
                return Colors.orange;
              }
              return null;
            }),
            foregroundColor: WidgetStatePropertyAll(Colors.yellow),
            overlayColor: WidgetStatePropertyAll(Colors.yellow.withValues(alpha: 0.5))
          ), label: Text("Text button with icon"),
          icon: Icon(Icons.add_circle)),
          ElevatedButton(onPressed: (){},
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white70,
                backgroundColor: Colors.yellow
              ),
              child: Text("Elevated button")),
          OutlinedButton.icon(onPressed: (){},
              style: OutlinedButton.styleFrom(
                side: BorderSide(width: 1,color: Colors.purple),
                //shape: StadiumBorder()
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(10)
                  )
              ),
              icon: Icon(Icons.add_circle),
              label: Text("Outlined with Icon"))
        ],
      ),
    );
  }
}

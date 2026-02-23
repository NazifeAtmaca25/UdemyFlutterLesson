import 'package:flutter/material.dart';

class Images extends StatefulWidget {
  const Images({super.key});

  @override
  State<Images> createState() => _ImagesState();
}

class _ImagesState extends State<Images> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Imagelar"),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.redAccent,
                    child: Image.asset("assets/image/araba.jpg"),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Image.network("https://cdn.pixabay.com/photo/2012/04/12/23/47/car-30984_1280.png"),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/image/araba2.jpg"),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

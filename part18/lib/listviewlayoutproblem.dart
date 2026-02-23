import 'package:flutter/material.dart';

class Listviewlayoutproblem extends StatelessWidget {
  const Listviewlayoutproblem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listview Layout Problem"),
      ),
      body: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 2,color: Colors.purple)
        ),
        child: Column(
          children: [
            Text("Nazife"),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    height: 200,
                    color: Colors.orange.shade200,
                  ),
                  Container(
                    height: 200,
                    color: Colors.orange,
                  ),
                  Container(
                    height: 200,
                    color: Colors.orange.shade200,
                  ),
                  Container(
                    height: 200,
                    color: Colors.orange,
                  )
                ],
              ),
            ),
            Text("Atmaca")
          ],
        ),
      ),
    );
  }
}

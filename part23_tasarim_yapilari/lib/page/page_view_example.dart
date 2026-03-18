import 'package:flutter/material.dart';

class PageViewExample extends StatefulWidget {
  const PageViewExample({super.key});

  @override
  State<PageViewExample> createState() => _PageViewExampleState();
}

class _PageViewExampleState extends State<PageViewExample> {
  var myController = PageController(
    initialPage: 0,
    keepPage: true,
    viewportFraction: 1,
  ); //an object that allows you to control which page is visible in a PageView widget
  bool yatayEksen = true;
  bool pageSnapping = true;
  bool reverseSira = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView(
            scrollDirection: yatayEksen == true
                ? Axis.horizontal
                : Axis.vertical,
            reverse: reverseSira,
            controller: myController,
            pageSnapping: pageSnapping,
            //bi anda diğer sayfaya geçmesini veya ekranı bıraktığımız yerde durmasını saülar
            onPageChanged: (index) {
              debugPrint('page change gelen index $index');
            },
            children: [
              Container(
                width: double.infinity,
                height: 300,
                color: Colors.pink,
                child: Center(
                  child: Column(
                    children: [
                      Text("Sayfa 1", style: TextStyle(fontSize: 30)),
                      ElevatedButton(
                        onPressed: () {
                          //myController.jumpTo(600);  ilerleme miktarı
                          myController.jumpToPage(2); //ilerleyeceği sayfa
                        },
                        child: Text("İkinci sayfaya git"),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 300,
                color: Colors.purple,
                child: Center(
                  child: Text("Sayfa 2", style: TextStyle(fontSize: 30)),
                ),
              ),
              Container(
                width: double.infinity,
                height: 300,
                color: Colors.blue.shade900,
                child: Center(
                  child: Text("Sayfa 3", style: TextStyle(fontSize: 30)),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            width: double.infinity,
            height: 200,
            color: Colors.grey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text("Yata ekrende çalış:"),
                      Checkbox(
                        value: yatayEksen,
                        onChanged: (bool? c) {
                          setState(() {
                            yatayEksen = c!;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text("Page Snapping"),
                      Checkbox(
                        value: pageSnapping,
                        onChanged: (bool? c) {
                          setState(() {
                            pageSnapping = c!;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text("Ters sırada çalış:"),
                    Checkbox(
                      value: reverseSira,
                      onChanged: (bool? c) {
                        setState(() {
                          reverseSira = c!;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

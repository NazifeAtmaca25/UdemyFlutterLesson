import 'package:flutter/material.dart';

class TabBarExample extends StatefulWidget {
  const TabBarExample({super.key});

  @override
  State<TabBarExample> createState() => _TabBarExampleState();
}

class _TabBarExampleState extends State<TabBarExample>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tab kullanımı"),
        bottom:
            buildTabBar(), // bu kısımda sadece PreferredSizeWidget olması lazım
      ),
      body: TabBarView(
        controller: controller,
        children: [
          Container(
            color: Colors.red,
            child: Center(child: Text("TAB 1", style: TextStyle(fontSize: 48))),
          ),
          Container(
            color: Colors.yellow,
            child: Center(child: Text("TAB 2", style: TextStyle(fontSize: 48))),
          ),
          Container(
            color: Colors.green,
            child: Center(child: Text("TAB 3", style: TextStyle(fontSize: 48))),
          ),
        ],
      ),
      bottomNavigationBar: buildTabBarBottom(),
    );
  }

  TabBar buildTabBar() {
    return TabBar(
      controller: controller,
      tabs: [
        Tab(icon: Icon(Icons.keyboard), text: "Tab 1"),
        Tab(icon: Icon(Icons.lock), text: "Tab 2"),
        Tab(icon: Icon(Icons.add_box), text: "Tab 3"),
      ],
    );
  }

  Widget buildTabBarBottom() {
    return Container(
      color: Colors.teal,
      child: TabBar(
        controller: controller,
        tabs: [
          Tab(icon: Icon(Icons.keyboard), text: "Tab 1"),
          Tab(icon: Icon(Icons.lock), text: "Tab 2"),
          Tab(icon: Icon(Icons.add_box), text: "Tab 3"),
        ],
      ),
    );
  }
}

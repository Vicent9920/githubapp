import 'package:flutter/material.dart';
import 'package:githubapp/widget/home_drawer.dart';

import 'entity/dynamic_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'GsyGithubApp'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<BottomNavigationBarItem> bottomNavItems = [
    const BottomNavigationBarItem(
        icon: Icon(IconData(0xe684, fontFamily: "wxcIconFont"),
            color: Color(0xffBDBEC0)),
        activeIcon: Icon(IconData(0xe684, fontFamily: "wxcIconFont"),
            color: Colors.white),
        label: "动态"),
    const BottomNavigationBarItem(
      icon: Icon(IconData(0xe818, fontFamily: "wxcIconFont"),
          color: Color(0xffBDBEC0)),
      activeIcon: Icon(IconData(0xe818, fontFamily: "wxcIconFont"),
          color: Colors.white),
      label: "趋势",
    ),
    const BottomNavigationBarItem(
      icon: Icon(IconData(0xe6d0, fontFamily: "wxcIconFont"),
          color: Color(0xffBDBEC0)),
      activeIcon: Icon(IconData(0xe6d0, fontFamily: "wxcIconFont"),
          color: Colors.white),
      label: "我的",
    )
  ];
  int currentIndex = 0;


  @override
  Widget build(BuildContext context) {
    var list = _buildData();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff24292E),
        title: Text(widget.title, style: const TextStyle(color: Colors.white)),
        actions: [
          Row(
            children: [
              InkWell(
                  onTap: () {},
                  child: const Icon(IconData(0xe61c, fontFamily: "wxcIconFont"),
                      color: Colors.white)),
              const SizedBox(width: 20),
            ],
          )
        ],
      ),
      drawer: const HomeDrawer(),
      body: ListView.builder(itemBuilder: (BuildContext context, int index){
        return Container(
          child: Column(
            children: [
              Row(
                children: [
                  Image.network(list[index].avatar_url),
                  Text(list[index].display_login),
                  Expanded(child: Container(),),
                  Text(list[index].created_at)
                ],
              ),
              Text(list[index].name)

            ],
          ),
        );
      },itemCount: list.length),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xff24292E),
        items: bottomNavItems,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.white,
        unselectedItemColor: const Color(0xffBDBEC0),
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
      )
    );
  }

  List<DynamicData> _buildData(){
    List<DynamicData> list = [];
    list.add(DynamicData("DLNA-Cast","https://avatars.githubusercontent.com/u/3939365?","devin1014/DLNA-Cast","2023-12-16T13:25:09Z"));
    list.add(DynamicData("DLNA-Cast","https://avatars.githubusercontent.com/u/3939365?","devin1014/DLNA-Cast","2023-12-16T13:25:09Z"));
    list.add(DynamicData("DLNA-Cast","https://avatars.githubusercontent.com/u/3939365?","devin1014/DLNA-Cast","2023-12-16T13:25:09Z"));
    list.add(DynamicData("DLNA-Cast","https://avatars.githubusercontent.com/u/3939365?","devin1014/DLNA-Cast/devin1014/DLNA-Cast/devin1014/DLNA-Cast/devin1014/DLNA-Cast","2023-12-16T13:25:09Z"));
    list.add(DynamicData("DLNA-Cast","https://avatars.githubusercontent.com/u/3939365?","devin1014/DLNA-Cast","2023-12-16T13:25:09Z"));
    list.add(DynamicData("DLNA-Cast","https://avatars.githubusercontent.com/u/3939365?","devin1014/DLNA-Cast","2023-12-16T13:25:09Z"));
    return list;
  }

}

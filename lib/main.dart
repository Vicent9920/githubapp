import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:githubapp/page/dynamic_page.dart';
import 'package:githubapp/page/mine_page.dart';
import 'package:githubapp/page/trend_page.dart';
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
    // 设置底部导航栏颜色
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Color(0xff24292E), // 设置底部导航栏颜色
    ));
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'GsyGithubApp'),
      color: const Color(0xff24292E),
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

  late PageController _controller;

  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var list = _buildData();
    return Scaffold(
      backgroundColor: const Color(0xff24292E),
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white), // 修改默认图标颜色
          backgroundColor: const Color(0xff24292E),
          title:
              Text(widget.title, style: const TextStyle(color: Colors.white)),
          actions: [
            Row(
              children: [
                InkWell(
                    onTap: () {},
                    child: const Icon(
                        IconData(0xe61c, fontFamily: "wxcIconFont"))),
                const SizedBox(width: 20),
              ],
            )
          ],
        ),
        drawer: const HomeDrawer(),
        body: PageView(
          onPageChanged: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          controller: _controller,
          children: const [DynamicPage(), TrendPage(), MinePage()],
        ),

        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color(0xff24292E),
          items: bottomNavItems,
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.white,
          unselectedItemColor: const Color(0xffBDBEC0),
          currentIndex: currentIndex,
          onTap: (value){
            if (currentIndex != value) {
              _controller.jumpToPage(value);
              setState(() {
                currentIndex = value;
              });
            }
          },
        ));
  }


}

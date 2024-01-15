import 'package:flutter/material.dart';

import '../entity/dynamic_data.dart';

class DynamicPage extends StatefulWidget {
  const DynamicPage({super.key});

  @override
  State<DynamicPage> createState() => _DynamicPageState();
}

class _DynamicPageState extends State<DynamicPage> {
  @override
  Widget build(BuildContext context) {
    var list = _buildData();
    return Container(
      color: const Color(0xfffafafa),
      child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(height: 20);
          },
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: const EdgeInsets.only(
                  left: 12, right: 12, top: 16, bottom: 16),
              margin: const EdgeInsets.only(left: 12, right: 12),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: const [
                    BoxShadow(
                        blurRadius: 2,
                        color: Color(0xffcccccc),
                        offset: Offset(4, 4))
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                          radius: 14,
                          backgroundImage:NetworkImage(list[index].avatar_url)),
                      const SizedBox(width: 6),
                      Text(list[index].display_login),
                      Expanded(
                        child: Container(),
                      ),
                      Text(list[index].created_at)
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(list[index].name)
                ],
              ),
            );
          },
          itemCount: list.length),
    );
  }

  List<DynamicData> _buildData() {
    List<DynamicData> list = [];
    list.add(DynamicData(
        "DLNA-Cast",
        "https://avatars.githubusercontent.com/u/3939365?",
        "devin1014/DLNA-Cast",
        "2023-12-16T13:25:09Z"));
    list.add(DynamicData(
        "DLNA-Cast",
        "https://avatars.githubusercontent.com/u/3939365?",
        "devin1014/DLNA-Cast",
        "2023-12-16T13:25:09Z"));
    list.add(DynamicData(
        "DLNA-Cast",
        "https://avatars.githubusercontent.com/u/3939365?",
        "devin1014/DLNA-Cast",
        "2023-12-16T13:25:09Z"));
    list.add(DynamicData(
        "DLNA-Cast",
        "https://avatars.githubusercontent.com/u/3939365?",
        "devin1014/DLNA-Cast/devin1014/DLNA-Cast/devin1014/DLNA-Cast/devin1014/DLNA-Cast",
        "2023-12-16T13:25:09Z"));
    list.add(DynamicData(
        "DLNA-Cast",
        "https://avatars.githubusercontent.com/u/3939365?",
        "devin1014/DLNA-Cast",
        "2023-12-16T13:25:09Z"));
    list.add(DynamicData(
        "DLNA-Cast",
        "https://avatars.githubusercontent.com/u/3939365?",
        "devin1014/DLNA-Cast",
        "2023-12-16T13:25:09Z"));
    return list;
  }
}

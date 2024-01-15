import 'package:flutter/material.dart';
import 'package:githubapp/page/dynamic/dynamic_mode.dart';

class DynamicPage extends StatefulWidget {
  const DynamicPage({super.key});

  @override
  State<DynamicPage> createState() => _DynamicPageState();
}

class _DynamicPageState extends State<DynamicPage> {
  late DynamicMode _dynamicMode;

  @override
  void initState() {
    _dynamicMode = DynamicMode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color(0xfffafafa),
        child: RefreshIndicator(
            onRefresh: () async {
              await Future.delayed(const Duration(seconds: 2)).then((value) {
                var data = _dynamicMode.list.value;
                data.add(_dynamicMode.list.value.last);
                _dynamicMode.list.value = data;
              });

            },
            child: ListenableBuilder(
              listenable: _dynamicMode.list,
              builder: (BuildContext context, Widget? child) {
                return ListView.separated(
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(height: 20);
                    },
                    itemBuilder: (BuildContext context, int index) {
                      var item = _dynamicMode.list.value[index];
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
                                    backgroundImage:
                                        NetworkImage(item.avatar_url)),
                                const SizedBox(width: 6),
                                Text(item.display_login),
                                Expanded(
                                  child: Container(),
                                ),
                                Text(item.created_at)
                              ],
                            ),
                            const SizedBox(height: 6),
                            Text(item.name)
                          ],
                        ),
                      );
                    },
                    itemCount: _dynamicMode.list.value.length);
              },
            )));
  }
}

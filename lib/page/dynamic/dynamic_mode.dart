
import 'package:flutter/material.dart';

import '../../entity/dynamic_data.dart';

class DynamicMode {

  ValueNotifier<List<DynamicData>> list = ValueNotifier(_buildData());

  static List<DynamicData> _buildData() {
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

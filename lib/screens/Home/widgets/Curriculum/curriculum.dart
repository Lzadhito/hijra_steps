import 'package:flutter/material.dart';
import 'package:hijra_steps/screens/Home/widgets/Loader/level_list_loader.dart';
import 'package:dio/dio.dart';
import 'dart:async';

import 'package:hijra_steps/screens/Home/entity/Level.dart';
import 'package:hijra_steps/screens/Home/widgets/constants/padding.dart';
import 'package:hijra_steps/screens/Home/widgets/Curriculum/level_list.dart';

class CurriculumWidget extends StatefulWidget {
  @override
  _CurriculumWidgetState createState() => _CurriculumWidgetState();
}

class _CurriculumWidgetState extends State<CurriculumWidget> {
  late Future<List<Level>> futureLevelData;

  Future<List<Level>> fetchLevel() async {
    const String url = "http://192.168.1.13:3000/curriculum";
    final response = await Dio().get(url);
    if (response.statusCode == 200) {
      final jsonData = response.data;
      List<Level> result = [];
      for (var i in jsonData) {
        Level curriculum = Level.fromJson(i);
        result.add(curriculum);
      }
      return result;
    } else {
      throw Exception('Failed to load curriculum');
    }
  }

  @override
  void initState() {
    super.initState();
    futureLevelData = fetchLevel();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: futureLevelData,
        builder: (context, AsyncSnapshot<List<Level>> snapshot) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: paddingHorizontal),
                child: const Text("Kurikulum Pembelajaran"),
              ),
              ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  separatorBuilder: (BuildContext context, int i) =>
                      SizedBox(height: 30),
                  itemCount: snapshot.hasData ? snapshot.data!.length : 3,
                  padding: EdgeInsets.only(top: 24.0),
                  itemBuilder: (BuildContext context, int index) {
                    if (snapshot.hasData)
                      return LevelList(level: snapshot.data![index]);
                    else
                      return LevelListLoader();
                  })
            ],
          );
        });
  }
}

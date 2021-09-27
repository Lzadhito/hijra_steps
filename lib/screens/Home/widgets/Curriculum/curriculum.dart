import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

import 'package:hijra_steps/screens/Home/services/curriculum_service.dart';

import 'package:hijra_steps/screens/Home/models/Level.dart';
import 'package:hijra_steps/screens/Home/widgets/Curriculum/level_list.dart';
import 'package:hijra_steps/screens/Home/widgets/Loader/level_list_loader.dart';

import 'package:hijra_steps/screens/Home/widgets/constants.dart'
    show paddingHorizontal;

class CurriculumWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: CurriculumService().fetchCurriculum(),
        builder: (context, AsyncSnapshot<List<Level>> snapshot) {
          return StickyHeader(
            header: Container(
              color: Colors.white,
              width: double.infinity,
              height: 55,
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: paddingHorizontal),
                child: Text(
                  "Kurikulum Pembelajaran",
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
            ),
            content: ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                separatorBuilder: (BuildContext context, int i) =>
                    SizedBox(height: 30),
                itemCount: snapshot.hasData ? snapshot.data!.length : 3,
                padding: EdgeInsets.only(bottom: 20.0),
                itemBuilder: (BuildContext context, int index) {
                  if (snapshot.hasData)
                    return LevelList(level: snapshot.data![index]);
                  else
                    return LevelListLoader();
                }),
          );
        });
  }
}

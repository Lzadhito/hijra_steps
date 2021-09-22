import 'package:flutter/material.dart';
import 'package:hijra_steps/screens/Home/services/curriculum_service.dart';
import 'package:hijra_steps/screens/Home/widgets/Loader/level_list_loader.dart';

import 'package:hijra_steps/screens/Home/models/Level.dart';
import 'package:hijra_steps/screens/Home/widgets/constants/padding.dart';
import 'package:hijra_steps/screens/Home/widgets/Curriculum/level_list.dart';

class CurriculumWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: CurriculumService().fetchCurriculum(),
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

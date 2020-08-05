import 'package:biceps_app/models/training_day.dart';
import 'package:biceps_app/ui/shared/constants.dart';
import 'package:biceps_app/ui/shared/ui_helpers.dart';
import 'package:flutter/material.dart';

class ProgramDetails extends StatelessWidget {
  final String name;
  final List<TrainingDay> trainingDays;

  const ProgramDetails({
    Key key,
    this.name,
    this.trainingDays,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: ListView.builder(
          itemCount: trainingDays.length,
          itemBuilder: (context, index) => Container(
            margin: EdgeInsets.symmetric(
              vertical: 3,
              horizontal: 15,
            ),
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  trainingDays[index].dayName,
                  style: kSmallHeaderLightGrey,
                ),
                Text(
                  trainingDays[index].purpose,
                  style: kTinyHeaderBlack,
                ),
                verticalSpaceTiny,
                ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: trainingDays[index].exercises.length,
                  itemBuilder: (context, insIndex) => Padding(
                    padding: EdgeInsets.only(
                      top: 2,
                      left: 15,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          trainingDays[index].exercises[insIndex]['name'],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Разминка: ${trainingDays[index].exercises[insIndex]['warm_up']}',
                        ),
                        Text(
                          'Рабочие сеты: ${trainingDays[index].exercises[insIndex]['work']}',
                        ),
                        verticalSpaceTiny,
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

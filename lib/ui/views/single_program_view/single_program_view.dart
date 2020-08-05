import 'package:biceps_app/models/program.dart';
import 'package:biceps_app/ui/shared/constants.dart';
import 'package:biceps_app/ui/shared/ui_helpers.dart';
import 'package:biceps_app/ui/views/single_program_view/single_program_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SingleProgramView extends StatelessWidget {
  final Program program;

  const SingleProgramView({
    Key key,
    this.program,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SingleProgramViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text(program.name),
        ),
        body: Container(
          margin: EdgeInsets.all(30),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'Краткое описание',
                  style: kSmallHeaderLightGrey,
                ),
                Text(program.description),
                verticalSpaceMedium,
                Text(
                  'Цель',
                  style: kSmallHeaderLightGrey,
                ),
                Text(program.goal),
                verticalSpaceMedium,
                Text(
                  'Уровень',
                  style: kSmallHeaderLightGrey,
                ),
                Text(program.trainingLevel),
                verticalSpaceMedium,
                Text(
                  'Тренировочных дней',
                  style: kSmallHeaderLightGrey,
                ),
                Text('${program.split} дня в неделю'),
                verticalSpaceMedium,
                Text(
                  'Продолжительность',
                  style: kSmallHeaderLightGrey,
                ),
                Text('${program.duration} недель(и)'),
                verticalSpaceMedium,
                Text(
                  'Аудитория',
                  style: kSmallHeaderLightGrey,
                ),
                Text(program.targetGender),
                verticalSpaceLarge,
                GestureDetector(
                  child: Container(
                    constraints: BoxConstraints.expand(height: 40),
                    decoration: BoxDecoration(
                      color: kPrimaryAccent,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        'Посмотреть упражнения',
                        style: kButtonTitleTextStyle,
                      ),
                    ),
                  ),
                  onTap: model.navigateToProgramDetails,
                ),
                verticalSpaceMedium,
                GestureDetector(
                  child: Container(
                    constraints: BoxConstraints.expand(height: 40),
                    decoration: BoxDecoration(
                      color: kPrimaryAccent,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        'Внести в дневник тренировок',
                        style: kButtonTitleTextStyle,
                      ),
                    ),
                  ),
                  onTap: model.sendProgramToDiary,
                ),
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => SingleProgramViewModel(program),
      onModelReady: (model) => model.fetchTrainingDays(),
    );
  }
}

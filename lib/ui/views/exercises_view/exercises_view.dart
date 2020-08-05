import 'package:biceps_app/ui/shared/constants.dart';
import 'package:biceps_app/ui/views/exercises_view/exercises_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:stacked/stacked.dart';

class ExercisesView extends StatelessWidget {
  final String muscleGroup;

  const ExercisesView({
    Key key,
    this.muscleGroup,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ExercisesViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text(muscleGroup),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: model.exercises != null
              ? ListView.builder(
                  itemCount: model.exercises.length,
                  itemBuilder: (context, index) => Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 3,
                      horizontal: 15,
                    ),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: kVeryLightGrey,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          model.exercises[index].imageAsset,
                          fit: BoxFit.cover,
                          width: 90,
                          height: 60,
                        ),
                      ),
                      title: Text(
                        model.exercises[index].name,
                        style: TextStyle(
                          fontFamily: 'RobotoCondensed',
                        ),
                      ),
                      subtitle: Text(model.exercises[index].type),
                      onTap: () => model.navigateToSingleExercise(index),
                    ),
                  ),
                )
              : Center(
                  child: SpinKitFadingCircle(
                    color: kPrimaryAccent,
                    size: 50,
                  ),
                ),
        ),
      ),
      viewModelBuilder: () => ExercisesViewModel(muscleGroup),
      onModelReady: (model) => model.fetchExercises(),
    );
  }
}

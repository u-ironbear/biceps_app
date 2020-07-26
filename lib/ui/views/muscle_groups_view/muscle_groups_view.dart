import 'package:biceps_app/ui/views/muscle_groups_view/muscle_groups_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class MuscleGroupsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MuscleGroupsViewModel>.reactive(
      builder: (context, model, child) => GridView.builder(
        padding: EdgeInsets.all(20),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 5 / 4,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemCount: model.muscleGroups.length,
        itemBuilder: (context, index) => ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: GestureDetector(
            onTap: () => model.navigateToExercisesView(index),
            child: GridTile(
              child: model.muscleGroups[index].image,
              footer: GridTileBar(
                backgroundColor: Colors.black54,
                title: Text(
                  model.muscleGroups[index].title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      viewModelBuilder: () => MuscleGroupsViewModel(),
    );
  }
}

import 'package:biceps_app/ui/views/training_day_view/training_day_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class TrainingDayView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TrainingDayViewModel>.reactive(
      builder: (context, model, child) => Scaffold(),
      viewModelBuilder: () => TrainingDayViewModel(),
    );
  }
}

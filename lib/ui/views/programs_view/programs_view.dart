import 'package:biceps_app/ui/views/programs_view/programs_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ProgramsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProgramsViewModel>.reactive(
      builder: (context, model, child) => Container(
        child: Center(
          child: Text('Programs'),
        ),
      ),
      viewModelBuilder: () => ProgramsViewModel(),
    );
  }
}

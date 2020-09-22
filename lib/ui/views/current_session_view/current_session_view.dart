import 'package:biceps_app/ui/views/current_session_view/current_session_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CurrentSessionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CurrentSessionViewModel>.reactive(
      builder: (context, model, child) => Scaffold(),
      viewModelBuilder: () => CurrentSessionViewModel(),
    );
  }
}

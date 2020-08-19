import 'package:biceps_app/models/diary.dart';
import 'package:biceps_app/ui/views/current_session_view/current_session_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CurrentSessionView extends StatelessWidget {
  final DiarySession session;

  const CurrentSessionView({Key key, this.session}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CurrentSessionViewModel>.reactive(
      builder: (context, model, child) => Scaffold(),
      viewModelBuilder: () => CurrentSessionViewModel(session),
    );
  }
}

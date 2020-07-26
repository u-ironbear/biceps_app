import 'package:biceps_app/ui/views/diary_view/diary_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class DiaryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DiaryViewModel>.reactive(
      builder: (context, model, child) => Container(
        child: Center(
          child: Text('Diary'),
        ),
      ),
      viewModelBuilder: () => DiaryViewModel(),
    );
  }
}

import 'package:biceps_app/ui/views/statistics_view/statistics_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class StatisticsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StatisticsViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('Статистика'),
        ),
        body: Center(
          child: Container(
            width: 250,
            child: Text(
              'Недостаточно данных для отображения статистики.',
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
      viewModelBuilder: () => StatisticsViewModel(),
    );
  }
}

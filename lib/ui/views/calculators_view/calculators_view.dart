import 'package:biceps_app/ui/views/calculators_view/calculators_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CalculatorsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CalculatorsViewModel>.reactive(
      builder: (context, model, child) => Container(
        child: Center(
          child: Text('Calculators'),
        ),
      ),
      viewModelBuilder: () => CalculatorsViewModel(),
    );
  }
}

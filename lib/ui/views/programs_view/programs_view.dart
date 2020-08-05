import 'package:biceps_app/ui/shared/constants.dart';
import 'package:biceps_app/ui/shared/sizes.dart';
import 'package:biceps_app/ui/views/programs_view/programs_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:stacked/stacked.dart';

class ProgramsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ViewModelBuilder<ProgramsViewModel>.reactive(
      builder: (context, model, child) => Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: (model.programs != null)
            ? ListView.builder(
                itemCount: model.programs.length,
                itemBuilder: (context, index) => GestureDetector(
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 20,
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 40,
                    ),
                    width: double.infinity,
                    height: SizeConfig.blockSizeVertical * 13,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: NetworkImage(model.programs[index].imageAsset),
                          fit: BoxFit.cover,
                        )),
                    child: Center(
                      child: Text(
                        model.programs[index].name,
                        style: kSmallPlusHeader,
                      ),
                    ),
                  ),
                  onTap: () => model.navigateToSingleProgram(index),
                ),
              )
            : Center(
                child: SpinKitFadingCircle(
                  color: kPrimaryAccent,
                  size: 50,
                ),
              ),
      ),
      viewModelBuilder: () => ProgramsViewModel(),
      onModelReady: (model) => model.fetchPrograms(),
    );
  }
}

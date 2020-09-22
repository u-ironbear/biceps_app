import 'dart:ui';

import 'package:biceps_app/ui/shared/constants.dart';
import 'package:biceps_app/ui/shared/sizes.dart';
import 'package:biceps_app/ui/shared/ui_helpers.dart';
import 'package:biceps_app/ui/views/diary_view/diary_viewmodel.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';

class DiaryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ViewModelBuilder<DiaryViewModel>.reactive(
      builder: (context, model, child) => Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: (model.currentProgram != null)
            ? SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    CalendarCarousel(
                      height: SizeConfig.safeBlockVertical * 50,
                      locale: 'ru',
                      dayPadding: 0,
                      daysHaveCircularBorder: false,
                      todayBorderColor: kPrimaryAccent,
                      todayButtonColor: kPrimaryAccent,
                      iconColor: kPrimaryAccent,
                      thisMonthDayBorderColor: Colors.grey[300],
                      weekdayTextStyle: TextStyle(
                        fontSize: 15,
                        color: kPrimaryDarkGrey,
                      ),
                      weekendTextStyle: TextStyle(
                        fontSize: 14,
                        color: kPrimaryAccent,
                      ),
                      headerTextStyle: TextStyle(
                        fontSize: 20,
                        color: kPrimaryDarkGrey,
                        fontFeatures: [FontFeature.enable('smcp')],
                      ),
                      markedDatesMap: model.markedDatesMap,
                    ),
                    verticalSpaceTiny,
                    Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Тренировка',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                if (model.isTransition)
                                  InkWell(
                                    onTap: null,
                                    child: Icon(
                                      MdiIcons.pageNext,
                                      color: kPrimaryAccent,
                                    ),
                                  ),
                              ],
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 20,
                            ),
                            width: double.infinity,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 20,
                              bottom: 15,
                              right: 20,
                            ),
                            child: Text(model.tasksForToday),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Программа',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                if (model.isTransition)
                                  InkWell(
                                    onTap: null,
                                    child: Icon(
                                      MdiIcons.pageNext,
                                      color: kPrimaryAccent,
                                    ),
                                  ),
                              ],
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 20,
                            ),
                            width: double.infinity,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 20,
                              bottom: 15,
                              right: 20,
                            ),
                            child: Text(model.currentProgram),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            : Center(
                child: SpinKitFadingCircle(
                  color: kPrimaryAccent,
                  size: 50,
                ),
              ),
      ),
      viewModelBuilder: () => DiaryViewModel(),
      onModelReady: (model) => model.fetchDiary(),
    );
  }
}

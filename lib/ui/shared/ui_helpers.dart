import 'package:biceps_app/ui/shared/constants.dart';
import 'package:flutter/material.dart';

const Widget horizontalSpaceTiny = SizedBox(width: 5.0);
const Widget horizontalSpaceSmall = SizedBox(width: 10.0);
const Widget horizontalSpaceMedium = SizedBox(width: 25.0);

const Widget verticalSpaceTiny = SizedBox(height: 5.0);
const Widget verticalSpaceSmall = SizedBox(height: 10.0);
const Widget verticalSpaceMedium = SizedBox(height: 25.0);
const Widget verticalSpaceLarge = SizedBox(height: 50.0);
const Widget verticalSpaceExtraLarge = SizedBox(height: 80.0);
const Widget verticalSpaceMassive = SizedBox(height: 120.0);

Widget spacedDividerMedium = Container(
  padding: EdgeInsets.symmetric(horizontal: 20),
  child: Column(
    children: const <Widget>[
      verticalSpaceMedium,
      const Divider(color: kPrimaryLightGrey, height: 5.0),
      verticalSpaceMedium,
    ],
  ),
);

Widget spacedDividerSmall = Container(
  padding: EdgeInsets.symmetric(horizontal: 20),
  child: Column(
    children: const <Widget>[
      verticalSpaceSmall,
      const Divider(color: kPrimaryLightGrey, height: 5.0),
      verticalSpaceSmall,
    ],
  ),
);

Widget verticalSpace(double height) => SizedBox(height: height);

double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

double screenHeightFraction(BuildContext context,
        {int dividedBy = 1, double offsetBy = 0}) =>
    (screenHeight(context) - offsetBy) / dividedBy;

double screenWidthFraction(BuildContext context,
        {int dividedBy = 1, double offsetBy = 0}) =>
    (screenWidth(context) - offsetBy) / dividedBy;

double halfScreenWidth(BuildContext context) =>
    screenWidthFraction(context, dividedBy: 2);

double thirdScreenWidth(BuildContext context) =>
    screenWidthFraction(context, dividedBy: 3);

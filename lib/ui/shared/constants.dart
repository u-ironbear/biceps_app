import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

DateFormat dateFormat = DateFormat('dd.MMM.yy');
const String kAppName = 'Biceps Fitness';
const String placeholderToken =
    'https://firebasestorage.googleapis.com/v0/b/biceps-training-app.appspot.com/o/portrait_placeholder.jpg?alt=media&token=8abbef61-2f03-4d01-a34c-93a551b4126b';

// Colors
const kPrimaryDarkGrey = Color(0xFF484D63);
const kPrimaryLightGrey = Color(0xFFA4A9AD);
const kPrimaryAccent = Color(0xFFF45140);
const kSecondaryAccent = Color(0xFF1BA3A8);
const kVeryLightGrey = Color(0xFFF0F0F0);

// Text Styles
const kButtonTitleTextStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w700,
);

const kBigHeader = TextStyle(
  color: Colors.white,
  fontFamily: 'RobotoCondensed',
  fontSize: 40,
  fontWeight: FontWeight.bold,
);

const kSmallHeader = TextStyle(
  color: Colors.white,
  fontSize: 18,
  fontFamily: 'OpenSans',
  fontWeight: FontWeight.w600,
);

const kSmallPlusHeader = TextStyle(
  color: Colors.white,
  fontSize: 22,
  fontFamily: 'OpenSans',
  fontWeight: FontWeight.w600,
  shadows: [
    Shadow(
      blurRadius: 8,
      color: Colors.black12,
      offset: Offset(5, 5),
    ),
  ],
);

const kTinyHeader = TextStyle(
  color: Colors.white,
  fontSize: 16,
  fontFamily: 'OpenSans',
  fontWeight: FontWeight.w600,
);

const kTinyHeaderBlack = TextStyle(
  color: Colors.black,
  fontSize: 16,
  fontFamily: 'OpenSans',
  fontWeight: FontWeight.w600,
);

const kSmallHeaderDark = TextStyle(
  color: kPrimaryDarkGrey,
  fontSize: 18,
  fontFamily: 'OpenSans',
  fontWeight: FontWeight.w400,
);

const kSmallHeaderLightGrey = TextStyle(
  color: kPrimaryLightGrey,
  fontSize: 18,
  fontFamily: 'OpenSans',
  fontWeight: FontWeight.w400,
);

const kMediumHeaderDark = TextStyle(
  color: kPrimaryDarkGrey,
  fontFamily: 'RobotoCondensed',
  fontSize: 28,
  fontWeight: FontWeight.bold,
);

const kDrawerText = TextStyle(
  color: kPrimaryLightGrey,
  fontSize: 15,
  fontFamily: 'OpenSans',
  fontWeight: FontWeight.w400,
);

const kSimpleTextWhite = TextStyle(
  color: Colors.white,
  fontSize: 15,
  fontFamily: 'RobotoCondensed',
  fontWeight: FontWeight.w400,
);

// Field Variables

const double fieldHeight = 55;
const double smallFieldHeight = 40;
const double inputFieldBottomMargin = 30;
const double inputFieldSmallBottomMargin = 0;
const EdgeInsets fieldPadding = const EdgeInsets.symmetric(
  horizontal: 15,
);
const EdgeInsets largeFieldPadding = const EdgeInsets.symmetric(
  horizontal: 15,
  vertical: 15,
);

// Box Decorations

BoxDecoration fieldDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(5),
  color: Colors.grey[200],
);

BoxDecoration disabledFieldDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(5),
  color: Colors.grey[100],
);

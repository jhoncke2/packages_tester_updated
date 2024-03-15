// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0xff081723);
  static const secondary = Color(0XFF909090);
  static const background = Color.fromRGBO(240, 236, 244, 1);
  static const textPrimaryLight = Color.fromRGBO(157, 167, 186, 1);
  static const textPrimary = Color.fromRGBO(22, 28, 32, 1);
  static const textPrimaryDark = Color.fromRGBO(253, 254, 254, 1);
  static const tableRow1 = Color.fromRGBO(253, 254, 254, 1);
  static const tableRow2 = Color.fromRGBO(245, 245, 245, 1);
  static const textBoxColor = Color.fromRGBO(214, 228, 232, 1);

  static const customWhite = Color.fromRGBO(230, 230, 230, 1);
}

enum ScreenSize{
  little,
  mid,
  big
}

enum ScreenOrientation{
  landscape,
  portrait
}

class AppDimens {
  static final AppDimens _instance = AppDimens._();

  AppDimens._()
      : _screenWidth = MediaQueryData.fromWindow(WidgetsBinding.instance.window)
            .size
            .width,
        _screenHeight = MediaQueryData.fromView(WidgetsBinding.instance.window)
            .size
            .height;

  factory AppDimens() => _instance;

  final double _screenHeight;
  final double _screenWidth;

  double get scaffoldHorizontalPadding => _screenWidth * 0.02;
  double get scaffoldVerticalPadding => _screenHeight * 0.01;
  double get normalContainerHorizontalMargin => _screenWidth * 0.022;
  double get normalContainerVerticalMargin => _screenHeight * 0.011;
  double get titleTextSize => 30;
  double get subtitleTextSize => 20;
  double get normalTextSize => 17;
  double get littleTextSize => 15;
  double get cardHeaderText => 25;
  double get cardBodyText => 19;
  double get normalContainerHorizontalPadding => _screenWidth * 0.015;
  double get bigContainerHorizontalPadding => _screenWidth * 0.045;
  double get normalContainerVerticalPadding => _screenHeight * 0.02;
  double get littleContainerHorizontalPadding => _screenWidth * 0.0075;
  double get littleContainerVerticalPadding => _screenHeight * 0.01;
  double get normalVerticalSpace => _screenHeight * 0.04;
  double get littleVerticalSpace => _screenHeight * 0.02;
  double get littleIconSize => 22;
  double get normalIconSize => 30;
  double get bigIconSize => 65;
  double get giantIconSize => 70;
  double get bigButtonHorizontalPadding => 40;
  double get appBarHeight => _screenHeight * 0.09;
  double get bigBorderRadius => _screenWidth * 0.1;
  double getHeightPercentage(double perc) => _screenHeight * perc;
  double getWidthPercentage(double perc) => _screenWidth * perc;



  static double getHeightWithoutContext(double perc) => (
    MediaQueryData.fromWindow(WidgetsBinding.instance.window)
    .size
    .width
  ) * perc;
  
  static double getWidthWithoutContext(double perc) => (
    MediaQueryData.fromWindow(WidgetsBinding.instance.window)
    .size
    .width
  ) * perc;

  static double giantText(BuildContext context){
    final minorSize = getSizeByOrientation(1, 1, false, context);
    return minorSize * (minorSize > 780? 0.045 : minorSize > 580? 0.049 : 0.065);
  }

  static double titleText(BuildContext context){
    final minorSize = getSizeByOrientation(1, 1, false, context);
    return minorSize * (minorSize > 780? 0.039 : minorSize > 580? 0.042 : 0.05);
  }

  static double subtitleText(BuildContext context){
    final minorSize = getSizeByOrientation(1, 1, false, context);
    return minorSize * (minorSize > 780? 0.031 : minorSize > 580? 0.033 : 0.045);
  }

  static double normalText(BuildContext context){
    final minorSize = getSizeByOrientation(1, 1, false, context);
    return minorSize * (minorSize > 780? 0.027 : minorSize > 580? 0.030 : 0.036);
  }

  static double littleText(BuildContext context){
    final minorSize = getSizeByOrientation(1, 1, false, context);
    return minorSize * (minorSize > 780? 0.027 : minorSize > 580? 0.029 : 0.0345);
  }

  static double tinyText(BuildContext context){
    final minorSize = getSizeByOrientation(1, 1, false, context);
    return minorSize * (minorSize > 780? 0.023 : minorSize > 580? 0.025 : 0.029);
  }

  static double normalSplashRadius(BuildContext context){
    final minorSize = getSizeByOrientation(1, 1, false, context);
    return minorSize > 780? 10 : minorSize > 580? 15 : 20;
  }

  static double giantIcon(BuildContext context){
    final minorSize = getSizeByOrientation(1, 1, false, context);
    return minorSize * (minorSize > 780? 0.59 : minorSize > 580? 0.065 : 0.09);
  }

  static double bigIcon(BuildContext context){
    final minorSize = getSizeByOrientation(1, 1, false, context);
    return minorSize * (minorSize > 780? 0.047 : minorSize > 580? 0.052 : 0.07);
  }

  static double normalIcon(BuildContext context){
    final minorSize = getSizeByOrientation(1, 1, false, context);
    return minorSize * (minorSize > 780? 0.039 : minorSize > 580? 0.042 : 0.05);
  }

  static double littleIcon(BuildContext context){
    final minorSize = getSizeByOrientation(1, 1, false, context);
    return minorSize * (minorSize > 780? 0.032 : minorSize > 580? 0.034 : 0.046);
  }

  static double tinyIcon(BuildContext context){
    final minorSize = getSizeByOrientation(1, 1, false, context);
    return minorSize * (minorSize > 780? 0.029 : minorSize > 580? 0.031 : 0.04);
  }

  

  static double getSizeByOrientation(double onLandscapePercentage, double onPortraitPercentage, bool takeMajor, BuildContext context){
    final media = _getMediaFromContext(context);
    final isLandScape = _isLandScape(media);
    late double size;
    if(isLandScape){
      size = onLandscapePercentage;
      if(takeMajor){
        return size * media.size.width;
      }else{
        return size * media.size.height;
      }
    }else{
      size = onPortraitPercentage;
      if(takeMajor){
        return size * media.size.height;
      }else{
        return size * media.size.width;
      }
    }
  }

  static double widthPercentage(double percentage, BuildContext context) =>
    _getMediaFromContext(context).size.width * percentage;
  
  static double heightPercentage(double percentage, BuildContext context) =>
    _getMediaFromContext(context).size.height * percentage;

  static MediaQueryData _getMediaFromContext(BuildContext context)
    => MediaQuery.of(context);

  static ScreenOrientation getOrientation(BuildContext context){
    final media = _getMediaFromContext(context);
    return _isLandScape(media)?
      ScreenOrientation.landscape:
      ScreenOrientation.portrait;
  }

  static bool _isLandScape(MediaQueryData media) =>
    media.orientation == Orientation.landscape;

  
  static ScreenSize getScreenDimension(BuildContext context){
    final minorSize = getSizeByOrientation(1, 1, false, context);
    return (
      minorSize > 750? ScreenSize.big
        : minorSize > 550? ScreenSize.mid
          : ScreenSize.little
    );
  }

  static double getSizeByScreenDimension(double bigPercentage, double midPercentage, double littlePercentage, bool isMajorScreenValue, BuildContext context){
    final screenSize = getScreenDimension(context);
    return (
      screenSize == ScreenSize.big?
        getSizeByOrientation(bigPercentage, bigPercentage, isMajorScreenValue, context):
        screenSize == ScreenSize.mid?
          getSizeByOrientation(midPercentage, midPercentage, isMajorScreenValue, context):
          getSizeByOrientation(littlePercentage, littlePercentage, isMajorScreenValue, context)
    );
  }
}

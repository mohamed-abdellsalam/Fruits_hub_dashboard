import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/utils/size_config.dart';

abstract class TextStyles {
  static TextStyle bold13(BuildContext context) => TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: getResponsiveFontSize(context, fontSize: 13),
      );

  static TextStyle bold23(BuildContext context) => TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: getResponsiveFontSize(context, fontSize: 23),
      );

  static TextStyle semiBold13(BuildContext context) => TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: getResponsiveFontSize(context, fontSize: 13),
      );

  static TextStyle regular13(BuildContext context) => TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: getResponsiveFontSize(context, fontSize: 13),
      );

  static TextStyle bold16(BuildContext context) => TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: getResponsiveFontSize(context, fontSize: 16),
      );

  static TextStyle bold19(BuildContext context) => TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: getResponsiveFontSize(context, fontSize: 19),
      );

  static TextStyle semiBold16(BuildContext context) => TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: getResponsiveFontSize(context, fontSize: 16),
      );

  static TextStyle bold28(BuildContext context) => TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: getResponsiveFontSize(context, fontSize: 28),
      );

  static TextStyle regular22(BuildContext context) => TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: getResponsiveFontSize(context, fontSize: 22),
      );

  static TextStyle semiBold11(BuildContext context) => TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: getResponsiveFontSize(context, fontSize: 11),
      );

  static TextStyle medium15(BuildContext context) => TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: getResponsiveFontSize(context, fontSize: 15),
      );

  static TextStyle regular26(BuildContext context) => TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: getResponsiveFontSize(context, fontSize: 26),
      );

  static TextStyle regular16(BuildContext context) => TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: getResponsiveFontSize(context, fontSize: 16),
      );

  static TextStyle regular11(BuildContext context) => TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: getResponsiveFontSize(context, fontSize: 11),
      );
}

double getResponsiveFontSize(context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;

  double lowerLimit = fontSize * .8;
  double upperLimit = fontSize * 1.2;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(context) {
  double width = MediaQuery.sizeOf(context).width;
  if (width < SizeConfig.tablet) {
    return width / 550;
  } else if (width < SizeConfig.desktop) {
    return width / 1000;
  } else {
    return width / 1920;
  }
}

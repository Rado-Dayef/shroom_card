import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shroom_card/constants/colors.dart';

extension NumbersExt on num {
  /// Loading.
  Widget get darkLoading => LoadingAnimationWidget.staggeredDotsWave(size: toDouble(), color: AppColors.greyColor);

  Widget get lightLoading => LoadingAnimationWidget.staggeredDotsWave(size: toDouble(), color: AppColors.whiteColor);

  /// Gap.
  SizedBox get gap => SizedBox(height: toDouble(), width: toDouble());

  /// Duration.
  Duration get hour => Duration(hours: toInt());

  Duration get min => Duration(minutes: toInt());

  Duration get sec => Duration(seconds: toInt());

  Duration get milSec => Duration(milliseconds: toInt());

  Duration get micSec => Duration(microseconds: toInt());

  /// Edge Insets.
  EdgeInsets get edgeInsetsAll => EdgeInsets.all(toDouble());

  EdgeInsets get edgeInsetsVertical => EdgeInsets.symmetric(vertical: toDouble());

  EdgeInsets get edgeInsetsHorizontal => EdgeInsets.symmetric(horizontal: toDouble());

  /// Border Radius.
  BorderRadius get borderRadiusAll => BorderRadius.circular(toDouble());

  BorderRadius get borderRadiusTop => BorderRadius.vertical(top: Radius.circular(toDouble()));

  BorderRadius get borderRadiusLeft => BorderRadius.horizontal(left: Radius.circular(toDouble()));

  BorderRadius get borderRadiusBottom => BorderRadius.vertical(bottom: Radius.circular(toDouble()));

  BorderRadius get borderRadiusRight => BorderRadius.horizontal(right: Radius.circular(toDouble()));

  BorderRadius get borderRadiusOnlyTopLeft => BorderRadius.only(topLeft: Radius.circular(toDouble()));

  BorderRadius get borderRadiusOnlyTopRight => BorderRadius.only(topRight: Radius.circular(toDouble()));

  BorderRadius get borderRadiusOnlyBottomLeft => BorderRadius.only(bottomLeft: Radius.circular(toDouble()));

  BorderRadius get borderRadiusOnlyBottomRight => BorderRadius.only(bottomRight: Radius.circular(toDouble()));

  BorderRadius get defaultOnlyTopBorderRadius => BorderRadius.only(topRight: Radius.circular(toDouble()), topLeft: Radius.circular(toDouble() + 10));

  BorderRadius get defaultOnlyLeftBorderRadius => BorderRadius.only(bottomLeft: Radius.circular(toDouble()), topLeft: Radius.circular(toDouble() + 10));

  BorderRadius get defaultOnlyRightBorderRadius => BorderRadius.only(topRight: Radius.circular(toDouble()), bottomRight: Radius.circular(toDouble() + 10));

  BorderRadius get defaultOnlyBottomBorderRadius => BorderRadius.only(bottomLeft: Radius.circular(toDouble()), bottomRight: Radius.circular(toDouble() + 10));

  BorderRadius get defaultVerticalBorderRadius =>
      BorderRadius.only(topRight: Radius.circular(toDouble()), bottomLeft: Radius.circular(toDouble()), topLeft: Radius.circular(toDouble() + 10), bottomRight: Radius.circular(toDouble() + 10));

  BorderRadius get defaultHorizontalBorderRadius =>
      BorderRadius.only(topLeft: Radius.circular(toDouble()), bottomRight: Radius.circular(toDouble()), topRight: Radius.circular(toDouble() + 10), bottomLeft: Radius.circular(toDouble() + 10));
}

extension TextExt on String {
  /// Toast.
  Future<bool?> get showToast => Fluttertoast.showToast(msg: this, textColor: AppColors.whiteColor, backgroundColor: AppColors.blackColor);
}
